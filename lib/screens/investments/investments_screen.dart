import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';

class InvestmentsScreen extends StatelessWidget {
  const InvestmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Investments')),
      body: ListView.builder(
        itemCount: investments.length,
        itemBuilder: (context, index) {
          final i = investments[index];
          return ListTile(
            title: Text(i.id),
            subtitle: Text('₹${i.amount}'),
            trailing: Chip(
              label: Text(i.isActive ? 'Active' : 'Completed'),
            ),
          );
        },
      ),
    );
  }
}
