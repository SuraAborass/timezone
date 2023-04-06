import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Constants/links.dart';


class OrderClient {
  Future<dynamic> getOrdersById(userId) async {
    var response = await http.get(Uri.parse("$baseLink/user/$userId/orders"));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<dynamic> getOrdersByEmail(userEmail) async {
    var response = await http.post(Uri.parse("$baseLink$ordersByEmailLink"),
        body: jsonEncode(<String, dynamic>{
          "email": userEmail,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<dynamic> postOrder(info, userId, cartItems) async {
    var response = await http.post(Uri.parse("$baseLink$postorderLink"),
        body: jsonEncode(<String, dynamic>{
          "info": info,
          "user_id": userId,
          "cart": cartItems,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }
}
