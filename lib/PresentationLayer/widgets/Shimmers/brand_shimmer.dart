import 'package:flutter/material.dart';
import 'package:timezone/PresentationLayer/widgets/Shimmers/shimmer.dart';

class BrandShimmerItem extends StatelessWidget {
  const BrandShimmerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(5.0),
        child: ShimmerWidget.circular(
          width: 60,
          height: 80,
        ));
  }
}
