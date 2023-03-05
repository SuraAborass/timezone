import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class ProductClient {
  Future<dynamic> getProduct() async {
    var response = await http.get(Uri.parse(baseLink + "products"));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}