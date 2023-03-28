import 'dart:convert';

import '../Clients/product_client.dart';
import '../Models/product.dart';

class ProductRepo {
  ProductClient client = ProductClient();
  Future<List<Product>> searchProduct(word) async {
    var response = await client.getSearchProduct(word);
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<Product>((json) => Product.fromMap(json)).toList();
    }
    return [];
  }
Future<List<Product>> myFeaturedProducts() async {
    var response = await client.getFeatured();
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<Product>((json) => Product.fromMap(json))
          .toList();

    }
    return [];
  }
  Future<List<Product>> productsByIds(ids) async {
    var response = await client.getProductsByIds(ids);
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<Product>((json) => Product.fromMap(json)).toList();
    }
    return [];
  }

   Future<List<Product>> getProducts() async {
    var response = await client.getProducts();
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<Product>((json) => Product.fromMap(json)).toList();
    }
    return [];
  }
}
