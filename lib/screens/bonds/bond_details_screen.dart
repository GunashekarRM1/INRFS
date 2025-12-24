import 'package:flutter/material.dart';
import '../../models/bond_model.dart';
import '../../widgets/risk_meter.dart';
import '../../widgets/yield_chart.dart';
import '../../widgets/pdf_button.dart';

class BondDetailsScreen extends StatelessWidget {
  final BondModel bond;

  const BondDetailsScreen({super.key, required this.bond});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(bond.name),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _section("Bond Overview", [
            _row("Issuer", bond.issuer),
            _row("CRISIL Rating", bond.rating),
            _row("Interest", "${bond.interest}%"),
            _row("Tenure", "${bond.tenure} years"),
            _row("IPO Date", bond.ipoDate),
          ]),
          _section(
            "Pros",
            bond.pros.map((e) => _bullet(e, Colors.green)).toList(),
          ),
          _section(
            "Cons",
            bond.cons.map((e) => _bullet(e, Colors.red)).toList(),
          ),
          _section(
            "Risk Analysis",
            [
              RiskMeter(rating: bond.rating),
            ],
          ),
          _section(
            "Yield Forecast",
            [
              YieldChart(interest: bond.interest),
            ],
          ),
          _section(
            "Documents",
            [
              PdfButton(
                pdfUrl: "https://www.example.com/bond_prospectus.pdf",
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text("Invest Now"),
          ),
        ],
      ),
    );
  }

  Widget _section(String title, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  Widget _row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _bullet(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(Icons.check_circle, size: 18, color: color),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
