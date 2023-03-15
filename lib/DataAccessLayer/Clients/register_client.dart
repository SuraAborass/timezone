import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class RegisterClient{
  Future<dynamic> register(name, email, password) async {
    var response = await http.post(Uri.parse(baseLink + "register"),
        body:
        jsonEncode(<String, dynamic>{"name" : name, "email": email, "password": password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}

