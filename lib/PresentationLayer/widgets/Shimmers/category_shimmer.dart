import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timezone/Constants/colors.dart';
import 'package:timezone/PresentationLayer/widgets/Shimmers/shimmer.dart';

class CategoryShimmerItem extends StatelessWidget {
  const CategoryShimmerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Shimmer.fromColors(
                  child: ShimmerWidget.roundedRectangular(
                    width: 80,
                    height: 100,
                  ),
                  baseColor: AppColors.shimmerBaseColor,
                  highlightColor: AppColors.shimmerHighLightColor)),
        ),
        Expanded(
            flex: 1,
            child: Shimmer.fromColors(
              child: ShimmerWidget.roundedRectangular(
                height: 5,
                width: 80,
              ),
              baseColor: AppColors.shimmerBaseColor,
              highlightColor: AppColors.shimmerHighLightColor,
            ))
      ],
    );
  }
}
