import 'package:flutter/material.dart';
import 'package:timezone/PresentationLayer/widgets/top_brand_item.dart';
import '../../BusinessLayer/controllers/top_brands_controller.dart';
import '../../Constants/colors.dart';
import 'package:get/get.dart';


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

                height: 140,
                width: deviceSize.width,
                decoration: const BoxDecoration(color: AppColors.black),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  itemCount: _controller.topBrands.length,
                  itemBuilder: (context, index) {
                    return TopBrandItem(brand: _controller.topBrands[index],);
                  },
                ),
              );
            }
        ),
      ],
    );
  }
}
