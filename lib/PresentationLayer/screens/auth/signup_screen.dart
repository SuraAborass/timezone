import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/font_styles.dart';
import '../../../Constants/routes.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool passwordvisible1 = true;
  bool passwordvisible2 = true;


  @override
  Widget build(BuildContext context) {
    final deviceSize=MediaQuery.of(context).size;

    return Directionality(
      textDirection: Get.locale!.languageCode == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
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
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.lightblack,
                  suffixIcon: IconButton(
                    icon: Icon(passwordvisible1
                        ? Icons.visibility
                        : Icons.visibility_off),
                    color: AppColors.grey2,
                    onPressed: () {
                      setState(() {
                        passwordvisible1 = !passwordvisible1;
                      });
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
                      borderSide: const BorderSide(color: AppColors.grey2)),
                ),
                keyboardType: TextInputType.visiblePassword,
                obscureText: passwordvisible1,
                maxLines: 1,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.lightblack ,
                  hintText: 'Confirm Your Password'.tr,
                  hintStyle: title1,
                  suffixIcon: IconButton(
                    icon: Icon(passwordvisible2
                        ? Icons.visibility
                        : Icons.visibility_off),
                    color: AppColors.grey2,
                    onPressed: () {
                      setState(() {
                        passwordvisible2 = !passwordvisible2;
                      });
                    },
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
                obscureText: passwordvisible2,
                maxLines: 1,
              ),
              const SizedBox(height: 30,),
              MaterialButton(height: 56,
                minWidth: deviceSize.width,
                color: AppColors.yellow ,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(20.0))),
                child: Text('Create Account'.tr, style: title ),
                onPressed: () {},
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
                      Get.toNamed(AppRoutes.homepage);
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
      ),
    );
  }
}
