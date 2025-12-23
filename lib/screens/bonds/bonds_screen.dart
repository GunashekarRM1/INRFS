import 'package:flutter/material.dart';

class BondsScreen extends StatelessWidget {
  const BondsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bonds'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.receipt_long),
            title: Text('Government Bond'),
            subtitle: Text('₹10,000 • 5 Years'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.receipt_long),
            title: Text('Corporate Bond'),
            subtitle: Text('₹25,000 • 3 Years'),
          ),
        ],
      ),
    );
  }
}
