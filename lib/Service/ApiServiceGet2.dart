import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas/Model/GetModel2.dart';

class AnimeService {
  static const String baseUrl = 'https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League';

  static Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final List<dynamic> data = jsonResponse['teams'];

        return data.map((json) => PostModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load anime');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
