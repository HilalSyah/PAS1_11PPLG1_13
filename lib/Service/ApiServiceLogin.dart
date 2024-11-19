import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas/Model/LoginPostModel.dart';

class ApiServiceLogin {
  final String baseUrl = 'https://mediadwi.com/api/latihan';

  // Fungsi untuk login
  Future<LoginModel> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: Uri(queryParameters: {
          'username': username.trim(),
          'password': password.trim(),
        }).query,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        if (jsonResponse['status'] == true) {
          // Ambil data user dari field 'data'
          return LoginModel.fromJson(jsonResponse);
        } else {
          // Error dari API
          throw Exception(jsonResponse['message']);
        }
      } else {
        // Error status code
        throw Exception('Failed to login. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Login Error: $e');
      rethrow; // Lanjutkan error untuk penanganan di UI
    }
  }
}
