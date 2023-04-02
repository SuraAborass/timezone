import 'package:flutter/material.dart';
import '../../../Constants/colors.dart';
import '../../widgets/appbar.dart';
import '../../widgets/drawer.dart';
import '../../widgets/page_title.dart';
import 'button_navigation.dart';
import 'package:get/get.dart';


class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Get.locale!.languageCode == "en"
          ? TextDirection.rtl
          : TextDirection.ltr,
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
                    child: pageTitle("About Us"),
                  ),
                ]
            ),
          )),
    );
  }
}
