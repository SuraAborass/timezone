import 'package:get/get.dart';
import 'package:timezone/BusinessLayer/controllers/user_controller.dart';
import 'package:timezone/Constants/routes.dart';
import '../../DataAccessLayer/Models/notification.dart';
import '../../DataAccessLayer/Models/product.dart';
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

  void gotoPayload(UserNotification userNotification){
    if(userNotification.type=='newProduct'){
        Product product = Product.fromMap(userNotification.data as Map<String,dynamic>);
      Get.toNamed(AppRoutes.productScreen,arguments: [product]);
    }
  }
  Future<void> getBackNotifications() async {
    isLoading.value = true;
    userNotifications = await backNotificationRepo.getNotifications(userController.user!.id);
    print(userNotifications);
    update();
    isLoading.value = false;
  }
}