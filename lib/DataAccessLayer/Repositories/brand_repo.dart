import 'dart:convert';
import '../Clients/brand_client.dart';
import '../Models/brand.dart';



class BrandsRepo {
  BrandsClient client = BrandsClient();
  Future<List<Brand>> myBrands() async {
    var response = await client.getBrands();
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<Brand>((json) => Brand.fromMap(json))
          .toList();
    }
    return [];
  }
}
