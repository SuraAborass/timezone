import 'dart:convert';
import '../Clients/featured_product_client.dart';
import '../Models/featured_product.dart';


class FeaturedProductRepo {
  FeaturedProductClient client = FeaturedProductClient();
  Future<List<FeaturedProduct>> isFeatured() async {
    var response = await client.getFeatured();
    if (response != "") {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed
          .map<FeaturedProduct>((json) => FeaturedProduct.fromMap(json))
          .toList();
    }
    return [];
  }
}
