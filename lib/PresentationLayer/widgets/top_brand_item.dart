import 'package:flutter/material.dart';
import 'package:timezone/DataAccessLayer/Models/brand.dart';
import 'package:get/get.dart';
import '../../Constants/font_styles.dart';
import '../../Constants/routes.dart';

class TopBrandItem extends StatelessWidget {
  const TopBrandItem({Key? key,required this.brand}) : super(key: key);
  final Brand brand;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 5.0, left: 5.0),
            child: InkWell(
              onTap: ()=> Get.toNamed(AppRoutes.collection,arguments: [brand]),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(brand.image),
              )
            ),),),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(brand.name,style: title8,),
        ),
      ],
    );
  }
}
