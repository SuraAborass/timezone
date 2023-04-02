import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/controllers/register_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/font_styles.dart';
import '../../../Constants/routes.dart';


class Register extends StatelessWidget {
   Register({Key? key}) : super(key: key);
final RegisterController registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Get.locale!.languageCode == "en"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: GetBuilder(
        init: registerController,
        builder: (context) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.black,
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 100),
                    alignment: Alignment.center,
                    child: Text(
                        "Create Account".tr, style: title),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    child: Text(
                        "To Get Full Access".tr,
                        style: title),
                  ),
                  const SizedBox(height: 50),
                  TextFormField(
                    style: mediumNormal,
                    controller: registerController.nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.lightblack,
                      border: const OutlineInputBorder(),
                      hintText: 'Enter Your Name'.tr,
                      hintStyle: title1,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 2,
                            color: AppColors.grey2),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: AppColors.grey2)),
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    style: mediumNormal,
                    controller: registerController.emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.lightblack,
                      border: const OutlineInputBorder(),
                      hintText: 'Enter Your Email'.tr,
                      hintStyle: title1,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 2,
                            color: AppColors.grey2),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: AppColors.grey2)),
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20),
                   TextFormField(
                    style: mediumNormal,
                    controller: registerController.passwordController,
                    // validator: (val){
                    //   if(val!.isEmpty)
                    //     return 'Password is required';
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.lightblack,
                      suffixIcon: IconButton(
                        icon: Icon(!registerController.passwordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                        color: AppColors.grey2,
                        onPressed: () {registerController.togglePasswordVisible();},
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
                          borderSide: const BorderSide(color: AppColors.grey2)),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !registerController.passwordVisible.value,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20),
                   TextFormField(
                    style: mediumNormal ,
                    controller: registerController.confirmPasswordController,
                    // validator: (value){
                    //   if(value!.isEmpty)
                    //     return 'Please retype your password';
                    //   if(value != registerController.passwordController.text)
                    //     return 'Not Match';
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.lightblack ,
                      hintText: 'Retype Your Password'.tr,
                      hintStyle: title1,
                      suffixIcon: IconButton(
                        icon: Icon(!registerController.passwordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                        color: AppColors.grey2,
                        onPressed: () {registerController.togglePasswordVisible();},
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(width: 2, color: AppColors.grey2),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: AppColors.grey2)),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !registerController.passwordVisible.value,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 30,),
                  MaterialButton(height: 56,
                    minWidth: Get.width,
                    color: AppColors.yellow ,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(20.0))),
                    child:  Obx(() {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (registerController.sending.value)
                            const CircularProgressIndicator(),
                          Text('Create Account'.tr, style: title)
                        ],
                      );
                    }),
                    onPressed: () async{
                    await registerController.register();
                    },
                  ),
                  const SizedBox( height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'Have an Account ?'.tr,
                          style: title1),
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.loginPage);
                        },
                        child: Text(
                            ' Login'.tr,
                            style: title2),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}