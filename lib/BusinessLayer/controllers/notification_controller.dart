import 'package:get/get.dart';
import 'package:timezone/BusinessLayer/controllers/user_controller.dart';
import '../../DataAccessLayer/Models/notification.dart';
import '../../DataAccessLayer/Repositories/notification_repo.dart';


class BackNotificationController extends GetxController{
  final UserController userController = Get.find();
  late List<UserNotification> userNotifications = [];
  var backNotificationRepo = NotificationRepo();
  var isLoading = false.obs;

  @override
  void onInit() async {
    await getBackNotifications();
    super.onInit();
  }

  Future<void> getBackNotifications() async {
    isLoading.value = true;
    userNotifications = await backNotificationRepo.getNotifications(userController.user!.id);
    print(userNotifications);
    update();
    isLoading.value = false;
  }
}