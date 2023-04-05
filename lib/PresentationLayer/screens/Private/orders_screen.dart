import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/controllers/orders_controller.dart';
import '../../../Constants/colors.dart';
import '../../widgets/Public/loading_item.dart';
import '../../widgets/appbar.dart';
import '../../widgets/drawer.dart';
import '../../widgets/order_item.dart';
import '../../widgets/page_title.dart';

class OrdersScreen extends StatelessWidget {
   OrdersScreen({Key? key}) : super(key: key);
  final OrdersController ordersController = Get.put(OrdersController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Get.locale!.languageCode == "en"
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
          backgroundColor: AppColors.black,
          appBar: myAppBar(context),
          drawer: MyDrawer(),
          body: GetBuilder(
            init: ordersController,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      pageTitle("Orders".tr),
                      Flexible(
                        child: ordersController.loading.value
                            ? Center(
                               child: loadingItem(true, size: 100),
                        )
                            : RefreshIndicator(
                          onRefresh: () async =>
                          await ordersController.getOrders(),
                           child: ListView.builder(
                                itemCount: ordersController.orders.length,
                                itemBuilder: (BuildContext context, int index) {
                                return orderItem(
                                  ordersController.orders[index]);
                            },
                          ),
                        ),
                      )

                    ]
                ),
              );
            })),
    );
  }
}
