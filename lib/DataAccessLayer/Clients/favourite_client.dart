import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class FavouriteClient{
  Future<dynamic> getFavourites(userId) async {
    var response = await http.get(Uri.parse(baseLink+ "user/${userId}/favorite"));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}