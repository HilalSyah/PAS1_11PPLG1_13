import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas/Model/SignPostModel.dart';

class ApiServiceSign {
  final String baseUrl = 'https://mediadwi.com/api/latihan';

  // Fungsi untuk register user
  Future<String> registerUser(SignUserModel user) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register-user'),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: user.toJson(),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == true) {
          // Registrasi sukses
          return jsonResponse['message'];
        } else {
          // Error dari API
          throw Exception(jsonResponse['message']);
        }
      } else {
        // Error status code
        throw Exception('Failed to register user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Register Error: $e');
      rethrow; // Lanjutkan error untuk penanganan di UI
    }
  }
}
