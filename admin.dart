import 'package:atelier5-majida-boutayeb-iir5g6/liste_produits.dart';
import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: ListeProduits(adminMode: true),
      // Add other admin-specific widgets as needed
    );
  }
}