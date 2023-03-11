import 'package:flutter/material.dart';
import '../../Constants/font_styles.dart';
import '../../Constants/routes.dart';
import '../../DataAccessLayer/Models/brand.dart';
import 'package:get/get.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({Key? key,required this.brand}) : super(key: key);
 final Brand brand;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () =>
                  Get.toNamed(AppRoutes.brand, arguments: [brand]),
              child: Container(
                height: 200,
                width: Get.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(brand.image), fit: BoxFit.cover),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            brand.name,
            style: bodyBold,
          ),
        ),
      ],
    );
  }
}
