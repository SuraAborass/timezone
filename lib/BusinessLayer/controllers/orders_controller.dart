import 'package:get/get.dart';
import '../../DataAccessLayer/Clients/box_client.dart';
import '../../DataAccessLayer/Models/order.dart';
import '../../DataAccessLayer/Repositories/orders_repo.dart';
import '../../main.dart';

class OrdersController extends GetxController{
  BoxClient boxClient = BoxClient();
  List<Order> orders = [];
  var loading = false.obs;
  OrdersRepo repo = OrdersRepo();

  Future<void> getOrders() async {
    loading.value = true;

    if (MyApp.AppUser != null) {
      orders = await repo.getOrders(MyApp.AppUser!.id);
    } else {
      String email = await boxClient.getSavedMail();
      if (email != "") {
        orders = await repo.getOrdersByMail(email);
      }
    }
    update();
    loading.value = false;
  }

  @override
  void onInit() async {
    await getOrders();
    super.onInit();
  }

}