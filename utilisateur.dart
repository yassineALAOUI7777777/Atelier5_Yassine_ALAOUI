import 'package:flutter/material.dart';

import 'liste_produits.dart';

class UserDashboard extends StatelessWidget {
  
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Dashboard'),
      ),
      body: ListeProduits(adminMode: false),
    );
  }
}