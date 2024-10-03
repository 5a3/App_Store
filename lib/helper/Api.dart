import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
        // 'Content-Type': 'application/json',
      });
    }

    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error: $response.statusCode');
    }
  }

  Future<dynamic> post(
      {required String url,
      required Map<String, dynamic> body,
      String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
        // 'Content-Type': 'application/json',
      });
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      // print(response.body);
      var data = jsonDecode(response.body);
      // print(response.headers);
      return data;
    } else {
      throw Exception(
          'Error: ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }

  Future<dynamic> put(
      {required String url,
      required Map<String, dynamic> body,
      String? token}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      // 'Content-Type': 'application/json',
    };
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
        // 'Content-Type': 'application/json',
      });
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      // print(response.body);
      var data = jsonDecode(response.body);
      // print(body);

      return data;
    } else {
      throw Exception(
          'Error: ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
}
