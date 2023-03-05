import 'dart:convert';
import '../Clients/product_client.dart';
import '../Models/product.dart';


class ProductRepo {
  ProductClient client = ProductClient();
  Future<List<Product>> myProduct() async {
    var response = await client.getProduct();
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<Product>((json) => Product.fromMap(json))
          .toList();

    }
    return [];
  }
}
