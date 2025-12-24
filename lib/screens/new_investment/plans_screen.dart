import 'package:flutter/material.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Investment Plans'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Choose Your Investment Plan',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Select the plan that best fits your financial goals',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),

            /// ✅ Responsive cards
            LayoutBuilder(
              builder: (context, constraints) {
                final bool isMobile = constraints.maxWidth < 600;

                // 🔴 FIXED: Explicit double
                final double cardWidth =
                    isMobile ? constraints.maxWidth : 260.0;

                return Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    _planCard(
                      width: cardWidth,
                      title: '1 Month Plan',
                      percent: '8%',
                      duration: 'Returns in 30 days',
                      points: const [
                        'Quick returns',
                        'Low risk investment',
                        'Flexible amount',
                        'Digital bond issued',
                      ],
                    ),
                    _planCard(
                      width: cardWidth,
                      title: '3 Month Plan',
                      percent: '12%',
                      duration: 'Returns in 90 days',
                      points: const [
                        'Better returns',
                        'Balanced risk',
                        'Popular choice',
                        'Digital bond issued',
                      ],
                    ),
                    _planCard(
                      width: cardWidth,
                      title: '6 Month Plan',
                      percent: '18%',
                      duration: 'Returns in 180 days',
                      highlight: true,
                      badge: 'MOST POPULAR',
                      points: const [
                        'High returns',
                        'Best value',
                        'Recommended plan',
                        'Digital bond issued',
                      ],
                    ),
                    _planCard(
                      width: cardWidth,
                      title: 'Yearly Plan',
                      percent: '24%',
                      duration: 'Returns in 365 days',
                      points: const [
                        'Maximum returns',
                        'Long term growth',
                        'Wealth building',
                        'Digital bond issued',
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔹 Helper widget (must be outside the class)
Widget _planCard({
  required double width,
  required String title,
  required String percent,
  required String duration,
  required List<String> points,
  bool highlight = false,
  String? badge,
}) {
  return Container(
    width: width,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: highlight ? Colors.blue : Colors.grey.shade300,
        width: highlight ? 2 : 1,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 10,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (badge != null)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              badge,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          percent,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        Text(
          duration,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 12),
        ...points.map(
          (p) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              children: [
                const Icon(
                  Icons.check,
                  size: 16,
                  color: Colors.green,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    p,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
             
            },
            child: const Text('Select Plan'),
          ),
        ),
      ],
    ),
  );
}
