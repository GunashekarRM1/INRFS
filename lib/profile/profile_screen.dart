import 'package:flutter/material.dart';
import '../models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel user;

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
            const SizedBox(height: 20),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Name'),
              subtitle: Text(user.name),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Mobile'),
              subtitle: Text(user.mobile),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Email'),
              subtitle: Text(user.email),
            ),
            ListTile(
              leading: const Icon(Icons.badge),
              title: const Text('Customer ID'),
              subtitle: Text(user.customerId),
            ),
          ],
        ),
      ),
    );
  }
}
