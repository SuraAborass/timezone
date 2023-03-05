import 'dart:convert';
import '../Clients/productsByBrandId_client.dart';
import '../Models/product.dart';


class ProductsByBrandRepo {
  ProductsByBrandClient client = ProductsByBrandClient();

  Future<List<Product>> products(brandId) async {
    var response = await client.getProducts(brandId);
    if (response != "") {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed
          .map<Product>((json) => Product.fromMap(json))
          .toList();
    }
    return [];
  }
}
