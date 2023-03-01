import 'package:flutter/material.dart';
import 'package:timezone/DataAccessLayer/Models/brand.dart';
import 'package:get/get.dart';
import '../../Constants/routes.dart';

class TopBrandItem extends StatelessWidget {
  const TopBrandItem({Key? key,required this.brand}) : super(key: key);
  final Brand brand;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: InkWell(
            onTap: ()=> Get.toNamed(AppRoutes.brand,arguments: [brand]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(brand.image),
              ),
            )
          ),),
      ],
    );
  }
}
