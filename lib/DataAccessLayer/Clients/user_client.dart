import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class UserClient {
  Future<dynamic> login(email, password) async {
    var response = await http.post(Uri.parse(baseLink + "login"),
        body:
        jsonEncode(<String, dynamic>{"email": email, "password": password}),
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
  Future<dynamic> updateInfo(id, name, email, password,mobileNumber) async {
    var response = await http.post(Uri.parse(baseLink + "updateProfile"),
        body: jsonEncode(<String, dynamic>{
          "id": id.toString(),
          "name": name,
          "email": email,
          "password": password,
          "mobileNumber" : mobileNumber
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
