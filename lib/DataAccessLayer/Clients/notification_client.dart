import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class NotificationClient{
  Future<dynamic> getNotifications() async {
    var response = await http.get(Uri.parse(baseLink+ "notifications"));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}