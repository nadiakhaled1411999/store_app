import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200) {
      jsonDecode(response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "there is a problem with status code ${response.statusCode}");
    }
  }

  Future<dynamic> post(
      {required String url, required dynamic body, String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
 print("url:$url body:$body token:$token");//!
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
 print('Data: $data');//!
      return data;
    } else {
      throw Exception(
          "there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}");
    }
  }

  Future<dynamic> put(
      {required String url, required dynamic body, String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({  "Content-Type": "application/json",});
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    print("url:$url body:$body token:$token");//!
    http.Response response =
        await http.put(Uri.parse(url), body: jsonEncode(body), headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
       print('Data: $data');//!
      return data;
    } else {
      throw Exception(
          "there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}");
    }
  }
}
