import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../BusinessLayer/controllers/top_categories_controller.dart';
import '../../Constants/colors.dart';
import 'Shimmers/category_shimmer.dart';
import 'TopCategoryItem.dart';

class TopCategories extends StatelessWidget {
  TopCategories({Key? key,}) : super(key: key);
  final TopCategoriesController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Column(
          children: [
            GetBuilder(
              init: _controller,
              builder: (context) {
                return Container(
                  height: 114,
                  width: deviceSize.width,
                  decoration: const BoxDecoration(color: AppColors.black),
                  child: _controller.loading.value== true
                      ? SizedBox(
                    height: 160,
                        child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                        return CategoryShimmerItem();
                    },
                  ),
                      )
                  :SizedBox(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      itemCount: _controller.categories.length,
                      itemBuilder: (context, index) {
                        return TopCategoryItem(category: _controller.categories[index],);
                      },
                    ),
                  ),
                );
              }
            ),
          ],
    );
  }
}
