import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import '../dashboard/investor_dashboard.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {

  void _verifyOtp() {
    // assume OTP success
    final user = UserModel(
      name: 'John Doe',
      mobile: '9876543210',
      email: 'john@example.com',
      customerId: 'I1234',
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => InvestorDashboard(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OTP Verification')),
      body: Center(
        child: ElevatedButton(
          onPressed: _verifyOtp,
          child: const Text('Verify OTP'),
        ),
      ),
    );
  }
}
