import 'package:atelier5-majida-boutayeb-iir5g6/firebase_options.dart';
import 'package:atelier5-majida-boutayeb-iir5g6/liste_produits.dart';

import 'package:firebase_core/firebase_core.dart';


import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
   bool adminMode = true;
  runApp( MaterialApp(
    home: ListeProduits(adminMode: adminMode),
  ));
}