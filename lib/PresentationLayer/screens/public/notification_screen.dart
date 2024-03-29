import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/controllers/notification_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/font_styles.dart';
import '../../widgets/appbar.dart';
import '../../widgets/drawer.dart';
import '../../widgets/notification_item.dart';
import '../../widgets/page_title.dart';
import '../../widgets/button_navigation.dart';

class Notifications extends StatelessWidget {
   Notifications({Key? key}) : super(key: key);
  final BackNotificationController backNotificationController = Get.find();

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
        bottomNavigationBar: const NavBar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: pageTitle("Notifications".tr),
              ),
              Padding(padding: const EdgeInsets.only(top: 10, bottom: 10,),
              child: RefreshIndicator(
                onRefresh: () async{
                  backNotificationController.getBackNotifications();},
                child: backNotificationController.userNotifications.isEmpty
                ? SizedBox(
                height: Get.height - 250,
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Text(
                        "No Notifications".tr,
                        style: titleBold.copyWith(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
                :SizedBox(
                  height: Get.height - 250,
                  child: ListView.builder(
                    itemCount: backNotificationController.userNotifications.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap:(){
                          backNotificationController.gotoPayload(backNotificationController.userNotifications[index]);
                        },
                        child: NotificationItem(
                          notification:
                          backNotificationController.userNotifications[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
        ),
        ]
    ),
    ))
    );
  }
}
