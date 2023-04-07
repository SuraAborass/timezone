import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/font_styles.dart';
import '../../widgets/appbar.dart';
import '../../widgets/drawer.dart';
import '../../widgets/page_title.dart';
import '../../widgets/button_navigation.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pageTitle("Check Out"),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      TextFormField(
                        style: mediumNormal,
                        decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: mediumNormal,
                          filled: true,
                          fillColor: AppColors.lightblack,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: AppColors.lightgrey),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: AppColors.grey2)),
                        ),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        style: mediumNormal,
                        decoration: InputDecoration(
                          labelText: "E-mail",
                          labelStyle: mediumNormal,
                          filled: true,
                          fillColor: AppColors.lightblack,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: AppColors.lightgrey),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: AppColors.grey2)),
                        ),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        style: mediumNormal,
                        decoration: InputDecoration(
                          labelText: "Address",
                          labelStyle: mediumNormal,
                          filled: true,
                          fillColor: AppColors.lightblack,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: AppColors.lightgrey),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: AppColors.grey2)),
                        ),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        style: mediumNormal,
                        decoration: InputDecoration(
                          labelText: "Mobile Number",
                          labelStyle: mediumNormal,
                          filled: true,
                          fillColor: AppColors.lightblack,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: AppColors.lightgrey),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: AppColors.grey2)),
                        ),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 60,),
                      MaterialButton(
                        onPressed: (){},
                        height: 56,
                        minWidth: Get.width,
                        color: AppColors.yellow,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20.0))),
                        child: Text('Continue', style: titleCopy),
                      )
                    ],
                  ),
                )
                ],
              ),
            ),
          )),
    );
  }
}
