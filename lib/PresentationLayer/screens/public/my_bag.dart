import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/font_styles.dart';
import '../../widgets/appbar.dart';
import '../../widgets/drawer.dart';
import '../../widgets/mybag_item.dart';
import '../../widgets/page_title.dart';

class MyBag extends StatelessWidget {
  const MyBag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize=MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: myAppBar(context),
      drawer: MyDrawer(),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 180,
          color: AppColors.black,
          child: Column(
            children:  [
               const SizedBox(height: 15,),
              Expanded(
                flex: 2,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                children:[
                      Text("Total :".tr,style: titleCopy7.copyWith(fontSize: 15),),
                      Text("   1.000.000 S.P",style: title8.copyWith(fontSize: 15))
                ],
              ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:[
                          Text("Discount :    ".tr,style: titleCopy7.copyWith(fontSize: 15),),
                          Text("20%",style: title7.copyWith(fontSize: 15, color: Colors.red))
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:[
                          Text("Net Value :    ".tr,style: titleCopy7.copyWith(fontSize: 15),),
                          Text("800.000 S.P",style: title8.copyWith(fontSize: 15,))
                        ],
                      ),
                    ],
                  )),
              Expanded(
                flex: 1,
                child: MaterialButton(
                  onPressed:(){},
                  height: 56,
                  minWidth: deviceSize.width,
                  color: AppColors.yellow ,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20.0))),
                  child: Text('Check Out'.tr, style: titleCopy ),),),],),),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              pageTitle("My Bag".tr),
              const MyBagItem(),
              const SizedBox(height: 15,),
              const MyBagItem(),
              const SizedBox(height: 15,),
              const MyBagItem(),
              const SizedBox(height: 15,),
              const MyBagItem(),
            ],
          ),
        ),
      ),
    );
  }
}
