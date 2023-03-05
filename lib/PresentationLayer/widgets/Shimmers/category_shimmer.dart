import 'package:flutter/material.dart';
import 'package:timezone/PresentationLayer/widgets/Shimmers/shimmer.dart';



class CategoryShimmerItem extends StatelessWidget {
  const CategoryShimmerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: ShimmerWidget.roundedRectangular(
                width: 80,
                height: 100,
              )
          ),
        ),
      Expanded(flex: 1,
          child: ShimmerWidget.roundedRectangular(height: 1,width: 60,))
      ],
    );
  }
}
