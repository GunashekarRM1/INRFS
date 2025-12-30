import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '../../routes/app_routes.dart';
import '../../services/auth_service.dart';
import '../dashboard/investor_dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController identifierCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  bool loading = false;

  @override
  void dispose() {
    identifierCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 🔹 Background Image
          Image.asset(
            'assets/images/share1.jpg',
            fit: BoxFit.cover,
          ),

          // 🔹 Dark Overlay
          Container(color: Colors.black.withValues(alpha: 0.4)
),

          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: 360,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.blue.shade100,
                      child: Icon(
                        Icons.person,
                        size: 36,
                        color: Colors.blue.shade700,
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Investor Login',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),
                    const Text(
                      'Access your investment portfolio',
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 24),

                    // 🔹 Email OR Investor ID
                    TextField(
                      controller: identifierCtrl,
                      decoration: InputDecoration(
                        labelText: 'Email or Investor Registration ID',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // 🔹 Password
                    TextField(
                      controller: passwordCtrl,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 🔹 Login Button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: loading ? null : _login,
                        child: loading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Login',
                                style: TextStyle(fontSize: 16),
                              ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // 🔹 Register Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.register,
                            );
                          },
                          child: const Text(
                            'Register here',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 LOGIN API CALL
  Future<void> _login() async {
    final identifier = identifierCtrl.text.trim();
    final password = passwordCtrl.text.trim();

    if (identifier.isEmpty || password.isEmpty) {
      _showSnack('Please enter all fields');
      return;
    }

    setState(() => loading = true);

    try {
      final res = await AuthService.loginUser(
        identifier: identifier,
        password: password,
      );
 if (!mounted) return; 
      // Adjust keys if backend response differs
      final user = UserModel(
        name: res['name'] ?? '',
        email: res['email'] ?? '',
        mobile: res['mobile'] ?? '',
        customerId: res['inv_reg_id'] ?? '',
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => InvestorDashboard(user: user),
        ),
      );
    } catch (e) {
      _showSnack(e.toString());
    } finally {
      setState(() => loading = false);
    }
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }
}
