import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/PresentationLayer/screens/auth/signup_screen.dart';

import '../../../BusinessLayer/controllers/login_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/font_styles.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Get.locale!.languageCode == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: GetBuilder(
          init: loginController,
          builder: (context) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: AppColors.black,
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 100),
                      alignment: Alignment.center,
                      child: Text("Welcome Back !".tr, style: title),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      child: Text("Please Sign In To Your Account".tr,
                          style: title),
                    ),
                    const SizedBox(height: 60),
                    TextFormField(
                      style: title1.apply(color: Colors.white),
                      controller: loginController.emailTextController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.lightblack,
                        border: const OutlineInputBorder(),
                        hintText: 'Enter Your Email'.tr,
                        hintStyle: title1,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2, color: AppColors.lightgrey),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: AppColors.grey2)),
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 20),
                    Obx(() {
                      return TextFormField(
                        style: title1.apply(color: Colors.white),
                        controller: loginController.passwordTextController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.lightblack,
                          suffixIcon: IconButton(
                            icon: Icon(!loginController.passwordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                            color: AppColors.grey2,
                            onPressed: () {
                              loginController.togglePasswordVisible();
                            },
                          ),
                          border: const OutlineInputBorder(),
                          hintText: 'Enter Your Password'.tr,
                          hintStyle: title1,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: AppColors.grey2),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  const BorderSide(color: AppColors.grey2)),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !loginController.passwordVisible.value,
                        maxLines: 1,
                      );
                    }),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Forget Password ?'.tr,
                            style: title1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    MaterialButton(
                      height: 56,
                      minWidth: Get.width,
                      color: AppColors.yellow,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      child: Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (loginController.sending.value)
                              const CircularProgressIndicator(),
                            Text('Login'.tr, style: title)
                          ],
                        );
                      }),
                      onPressed: () async {
                        await loginController.login();
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      height: 56,
                      minWidth: Get.width,
                      color: AppColors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Image 1.png',
                            height: 20,
                            width: 20,
                          ),
                          Text('  Continue With Google'.tr, style: title1),
                        ],
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t Have an Account?'.tr, style: title1),
                        InkWell(
                          onTap: () {
                            Get.to(Register());
                          },
                          child: Text(' Create One'.tr, style: title2),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
