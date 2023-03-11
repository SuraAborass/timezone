import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timezone/PresentationLayer/widgets/Shimmers/shimmer.dart';

import '../../../Constants/colors.dart';

class FeaturedShimmerItem extends StatelessWidget {
  const FeaturedShimmerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Shimmer.fromColors(
            child: ShimmerWidget.roundedRectangular(
              width: 130,
              height: 250,
            ),
            baseColor: AppColors.shimmerBaseColor,
            highlightColor: AppColors.shimmerHighLightColor));
  }
}
