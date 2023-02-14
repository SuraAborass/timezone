import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class ProductsByCategoryClient {
  Future<dynamic> getProducts(categoryId) async {
    var response =
    await http.get(Uri.parse(baseLink + "category/${categoryId}/products"));
    print("sura");
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
