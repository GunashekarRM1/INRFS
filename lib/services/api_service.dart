import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://inrfs-be.onrender.com';

  static Future<Map<String, dynamic>> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String mobile,
    required String password,
  }) async {
    final Uri url = Uri.parse('$baseUrl/users/register');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "mobile": mobile,
        "password": password,

        // REQUIRED BY BACKEND
        "gender_id": 1,
        "age": 25,
        "dob": "1999-01-01"
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'Registration failed: ${response.statusCode} - ${response.body}',
      );
    }
  }
}
