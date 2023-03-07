import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timezone/PresentationLayer/widgets/Shimmers/shimmer.dart';
import '../../../Constants/colors.dart';


class BrandShimmer extends StatelessWidget {
  const BrandShimmer({Key? key}) : super(key: key);

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
                    width: 120,
                    height: 120,
                  ),
                  baseColor: AppColors.shimmerBaseColor,
                  highlightColor: AppColors.shimmerHighLightColor)),
        ),
        Expanded(
            flex: 1,
            child: Shimmer.fromColors(
              child: ShimmerWidget.roundedRectangular(
                height: 5,
                width: 100,
              ),
              baseColor: AppColors.shimmerBaseColor,
              highlightColor: AppColors.shimmerHighLightColor,
            ))
      ],
    );
  }
}
