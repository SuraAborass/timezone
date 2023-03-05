import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class ProductsByBrandClient {
  Future<dynamic> getProducts(brandId) async {
    var response =
    await http.get(Uri.parse(baseLink + "brand/${brandId}/products"));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
