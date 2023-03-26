import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/links.dart';

class ProductClient {
  Future<dynamic> getProduct() async {
    var response = await http.get(Uri.parse(baseLink + productsLink));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
 Future<dynamic> getFeatured() async {
    var response = await http.get(Uri.parse(baseLink + "featureProducts"));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
  Future<dynamic> getProductsByIds(ids) async {
    var response = await http.post(Uri.parse(baseLink + productsByIdLink),
        body: jsonEncode(<String, dynamic>{"ids": ids}),
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

  Future<dynamic> getSearchProduct(word) async {
    var response = await http.get(Uri.parse(baseLink + "search/${word}"));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
