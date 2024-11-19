import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas/Model/GetModel.dart';

class ApiServiceGet {
  final String baseUrl = 'https://www.thesportsdb.com';

  Future<List<Getmodel>> fetchPosts() async {
    final response = await http.get(Uri.parse(
        '$baseUrl/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League'));

    if (response.statusCode == 200) {
      var jsonRes = json.decode(response.body);

      List data = jsonRes['teams'];

      return data.map((json) => Getmodel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
