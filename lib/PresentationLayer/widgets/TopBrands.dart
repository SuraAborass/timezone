import 'package:flutter/material.dart';
import 'package:timezone/PresentationLayer/widgets/top_brand_item.dart';
import '../../BusinessLayer/controllers/top_brands_controller.dart';
import '../../Constants/colors.dart';
import 'package:get/get.dart';

import 'Shimmers/brand_shimmer.dart';


class TopBrands extends StatelessWidget {
   TopBrands({Key? key}) : super(key: key);
  final TopBrandsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Column(
      children: [
        GetBuilder(
            init: _controller,
            builder: (context) {
              return Container(
                height: 94,
                width: deviceSize.width,
                decoration: const BoxDecoration(color: AppColors.black),
                child: _controller.loading.value== true
                ? SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return BrandShimmerItem();
                    },
                  ),
                )
               :SizedBox(
                  height: 160,
                 child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    itemCount: _controller.topBrands.length,
                    itemBuilder: (context, index) {
                      return TopBrandItem(brand: _controller.topBrands[index],);
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
