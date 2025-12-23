import 'package:flutter/material.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Investment Plans'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              title: const Text('3 Month Plan'),
              subtitle: const Text('₹5,000 • 6% Returns'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {},
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('6 Month Plan'),
              subtitle: const Text('₹10,000 • 8% Returns'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {},
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('1 Year Plan'),
              subtitle: const Text('₹20,000 • 12% Returns'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
