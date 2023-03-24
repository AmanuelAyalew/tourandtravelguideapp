import 'dart:convert';
import 'package:tourandtravel/model/register.dart';

import 'package:http/http.dart' as http;

main() async {
  AuthService authservice = AuthService();
  var responseBody =
      await authservice.registration("aman", "aman1234@gmail.com", "aman1234");
  print(responseBody);
}

class AuthService {
  final registrationurl =
      Uri.parse("http://192.168.137.164:8000/tour/register");
  Future<Register> registration(
    String username,
    String email,
    String password,
  ) async {
    var response = await http.post(registrationurl, body: {
      "username": username,
      "eamil": email,
      "password": password,
    });

    return Register.fromJson(jsonDecode(response.body));
  }
}
