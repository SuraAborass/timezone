import 'dart:convert';
import '../Clients/featured_client.dart';
import '../Models/featured_product.dart';


class FeaturedRepo {
  FeaturedClient client = FeaturedClient();
  Future<List<FeaturedProduct>> myFeaturedProducts() async {
    var response = await client.getFeatured();
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<FeaturedProduct>((json) => FeaturedProduct.fromMap(json))
          .toList();

    }
    return [];
  }
}
