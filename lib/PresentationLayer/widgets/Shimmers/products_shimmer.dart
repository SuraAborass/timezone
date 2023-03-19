import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timezone/PresentationLayer/widgets/Shimmers/shimmer.dart';
import '../../../Constants/colors.dart';


class ProductsShimmer extends StatelessWidget {
  const ProductsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighLightColor,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Row(
          children: [
            ShimmerWidget.roundedRectangular(width: 75, height: 75),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ShimmerWidget.rectangular(height: 20),
                      SizedBox(
                        height: 10,
                      ),
                      ShimmerWidget.rectangular(height: 20),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
