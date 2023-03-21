import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Constants/routes.dart';
import '../../DataAccessLayer/Clients/box_client.dart';
import '../../DataAccessLayer/Models/user.dart';
import '../../main.dart';

class UserController extends GetxController {
  final BoxClient boxClient = BoxClient();
  final box = GetStorage();
  User? user;
  bool authed = false;
  @override
  void onInit() async {
    super.onInit();
    authed = await boxClient.getAuthState();
    if (authed) {
      user = await boxClient.getAuthedUser();
      update();
      print(user!.toMap());
    }
    update();
  }

  Future<void> saveAuthState(User user) async {
    await boxClient.setAuthedUser(user);
    user = user;
    update();
    Get.offAndToNamed(AppRoutes.homepage);
  }

  Future<void> logout() async {
    await boxClient.removeUserData();
    MyApp.AppUser = null;
    Get.toNamed(AppRoutes.loginPage);
  }
}
