library api;

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<dynamic> post(String url, Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      return _processResponse(response);
    } catch (e) {
      throw Exception('Network Error: $e');
    }
  }

  Future<dynamic> get(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      return _processResponse(response);
    } catch (e) {
      throw Exception('Network Error: $e');
    }
  }

  dynamic _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error ${response.statusCode}: ${response.body}');
    }
  }
}
