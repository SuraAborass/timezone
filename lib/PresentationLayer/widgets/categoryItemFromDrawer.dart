import 'package:flutter/material.dart';
import '../../Constants/font_styles.dart';
import '../../Constants/routes.dart';
import '../../DataAccessLayer/Models/category.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key,required this.category}) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () =>
                  Get.toNamed(AppRoutes.category, arguments: [category]),
              child: Container(
                height: 120,
                width: Get.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(category.image), fit: BoxFit.cover),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            category.name,
            style: bodyBold.copyWith(fontSize: 14 ),
          ),
        ),
      ],
    );
  }
}
