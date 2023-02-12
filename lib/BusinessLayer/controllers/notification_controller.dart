import 'package:get/get.dart';
import '../../DataAccessLayer/Models/notification.dart';
import '../../DataAccessLayer/Repositories/notification_repo.dart';


class BackNotificationController extends GetxController{
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
    userNotifications = await backNotificationRepo.getNotifications();
    print(userNotifications);
    update();
    isLoading.value = false;
  }
}