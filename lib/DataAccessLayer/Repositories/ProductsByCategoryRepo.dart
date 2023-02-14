import 'dart:convert';
import '../Clients/ProductsByCategoryClient.dart';
import '../Models/product.dart';


class ProductsByCategoryRepo {
  ProductsByCategoryClient client = ProductsByCategoryClient();

  Future<List<Product>> products(categoryId) async {
    var response = await client.getProducts(categoryId);
    if (response != "") {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed
          .map<Product>((json) => Product.fromMap(json))
          .toList();
    }
    return [];
  }
}
