
import 'package:atelier5-majida-boutayeb-iir5g6/produit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class ListeProduits extends StatefulWidget {
  

  const ListeProduits({Key? key, required bool adminMode}) : super(key: key);

  @override
  _ListeProduitsState createState() => _ListeProduitsState();
}

class _ListeProduitsState extends State<ListeProduits> {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> supprimerProduit(String produitId) async {
    try {
      await db.collection('produits').doc(produitId).delete();
    } catch (e) {
      print('Erreur lors de la suppression du produit : $e');
    }
  }

  Future<void> ajouterProduit() async {
    try {
      await db.collection('produits').add({
        'marque': "Hello",
        'designation': "Classic",
        'categorie': 'cat',
        'prix': 55,
        'photoUrl': "",
        'quantite': 155
      });
    } catch (e) {
      print('Erreur lors de l\'ajout du produit : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des produits'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('produits').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Une erreur est survenue'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Produit> produits = snapshot.data!.docs.map((doc) {
            return Produit.fromFirestore(doc);
          }).toList();
          return ListView.builder(
            itemCount: produits.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(produits[index].designation),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Marque: ${produits[index].marque}'),
                  Text('Categorie: ${produits[index].categorie}'),
                  Text('Prix: \$${produits[index].prix}'),
                  Text('Quantite: ${produits[index].quantite}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Appeler la fonction de suppression avec l'ID du produit
                      supprimerProduit(produits[index].id);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Appeler la fonction d'ajout
          ajouterProduit();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
