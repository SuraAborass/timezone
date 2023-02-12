import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class FeaturedProductClient {
  Future<dynamic> getFeatured() async {
    var response = await http.get(Uri.parse(baseLink + "productsIsFeature"));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}