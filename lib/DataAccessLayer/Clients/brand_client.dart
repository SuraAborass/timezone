import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class BrandsClient {
  Future<dynamic> getBrands() async {
    var response = await http.get(Uri.parse(baseLink + "brands"));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}