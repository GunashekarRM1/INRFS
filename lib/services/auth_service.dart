import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'https://inrfs-be.onrender.com';

  /// Login using either EMAIL or INVESTOR REGISTRATION ID
  /// Backend rule:
  /// - Send ONLY ONE of: email OR inv_reg_id
  static Future<Map<String, dynamic>> loginUser({
    required String identifier, // email OR inv_reg_id
    required String password,
  }) async {
    final Uri url = Uri.parse('$baseUrl/users/login');

    final Map<String, dynamic> body = {
      "password": password,
    };

    // Decide which field to send
    if (identifier.contains('@')) {
      body["email"] = identifier;
    } else {
      body["inv_reg_id"] = identifier;
    }

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      final error = jsonDecode(response.body);
      throw Exception(error['detail'] ?? 'Login failed');
    }
  }
}
