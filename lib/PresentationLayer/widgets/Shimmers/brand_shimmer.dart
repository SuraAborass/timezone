import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timezone/PresentationLayer/widgets/Shimmers/shimmer.dart';

import '../../../Constants/colors.dart';

class BrandShimmerItem extends StatelessWidget {
  const BrandShimmerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.all(5.0),
        child: Shimmer.fromColors(
          child: ShimmerWidget.circular(
            width: 60,
            height: 80,
          ),
            baseColor: AppColors.shimmerBaseColor,
            highlightColor: AppColors.shimmerHighLightColor
        ));
  }
}
