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

  Future<dynamic> updateInfo(
      id, name, email, password, address, mobile_number) async {
    var response = await http.post(Uri.parse(baseLink + "updateProfile"),
        body: jsonEncode(<String, dynamic>{
          "id": id.toString(),
          "name": name,
          "email": email,
          "password": password,
          "address": address,
          "mobile_number": mobile_number.toString(),
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

  Future<dynamic> updateAvatar(id, image) async {
    /* String headers = "Bearer "; */
    var url = Uri.parse(baseLink + "updateAvatar");
    print(url.toString());
    var request = http.MultipartRequest("POST", url)
      ..fields.addAll(<String, String>{
        "id": id.toString(),
        "avatar": image,
      })
      ..headers.addAll(<String, String>{
        'Content-Type': 'multipart/form-data',
        /* HttpHeaders.authorizationHeader: headers */
      })
      ..files.add(await http.MultipartFile.fromPath('avatar', image));
    var response = await request.send();
/*     print(response.stream.bytesToString().toString()); */
    print(response.statusCode);
    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      return null;
    }
  }
}
