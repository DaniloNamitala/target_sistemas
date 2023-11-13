import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginRepository {
  LoginRepository();

  Future<bool> login(String user, String pass) async {
    http.Response result = await getUser(user);
    if (result.statusCode == 200) {
      return jsonDecode(result.body)['password'] == pass;
    }
    return false;
  }

  Future<http.Response> getUser(String username) {
    return http.get(Uri.parse(
        'https://655185b65c69a7790328e202.mockapi.io/login/v1/user/$username'));
  }
}
