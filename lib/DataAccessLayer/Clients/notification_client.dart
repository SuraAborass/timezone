import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class NotificationClient{
  Future<dynamic> getNotifications(userId) async {
    var response = await http.get(Uri.parse(baseLink+ "user/${userId}/notifications"));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}