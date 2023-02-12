import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class CategoriesClient {
  Future<dynamic> getCategories() async {
    var response = await http.get(Uri.parse(baseLink + "categories"));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}