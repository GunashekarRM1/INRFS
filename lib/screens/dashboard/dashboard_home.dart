import 'package:flutter/material.dart';
import '../../models/user_model.dart';

class DashboardHome extends StatelessWidget {
  final UserModel user;

  const DashboardHome({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // Dummy investment data (later from backend)
    final investments = [
      {'amount': 10000, 'returns': 1800, 'active': true},
      {'amount': 5000, 'returns': 600, 'active': true},
      {'amount': 20000, 'returns': 4800, 'active': false},
    ];

    final totalInvested =
        investments.fold<int>(0, (sum, i) => sum + (i['amount'] as int));

    final totalReturns =
        investments.fold<int>(0, (sum, i) => sum + (i['returns'] as int));

    final activeCount =
        investments.where((i) => i['active'] == true).length;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome Back, ${user.name}',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text('Customer ID: ${user.customerId}'),

          const SizedBox(height: 20),

          Row(
            children: [
              _summary('Total Invested', '₹$totalInvested', Icons.wallet),
              const SizedBox(width: 12),
              _summary('Total Returns', '₹$totalReturns', Icons.trending_up),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              _summary('Active Investments', '$activeCount', Icons.pie_chart),
              const SizedBox(width: 12),
              _summary('Digital Bonds', '8', Icons.receipt_long),
            ],
          ),
        ],
      ),
    );
  }

  Expanded _summary(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 6),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
