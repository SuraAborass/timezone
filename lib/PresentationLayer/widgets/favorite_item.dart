import 'package:flutter/material.dart';

import '../../Constants/colors.dart';
import '../../Constants/font_styles.dart';
import '../screens/public/product_screen.dart';
import 'package:get/get.dart';


class FavoriteItem extends StatelessWidget {
  const FavoriteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize=MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(color: AppColors.lightblack,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      height: 100,
      width: deviceSize.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: ()=> Get.to(const ProductScreen()),
              child: Container(
                // margin: const EdgeInsets.all(8.0),
                decoration: const  BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/Image 6.png'),fit: BoxFit.cover),
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                height: 90,
                width: 90 ,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListTile(
              title: const Text("Flounce Sleeve V Neck Puff Sleeve Blouse",style: title5,textAlign: TextAlign.start),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("50.000",style: title7),
                  Text("    40.000",style: title8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
