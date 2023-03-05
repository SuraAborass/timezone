import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;
  const ShimmerWidget.circular(
      {Key? key, required this.width, required this.height,
        this.shapeBorder = const CircleBorder()}) : super(key: key);
  const ShimmerWidget.rectangular(
      {Key? key,
        this.width = double.infinity,
        required this.height,
        this.shapeBorder = const RoundedRectangleBorder()})
      : super(key: key);
  const ShimmerWidget.roundedRectangular(
      {Key? key, required this.width, required this.height,
        this.shapeBorder = const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)))})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            shape: shapeBorder,
            color: Color.fromARGB(255, 112, 112, 112),
          ),
        ),
        baseColor: Color.fromARGB(255, 112, 112, 112),
        highlightColor: Color.fromARGB(255, 112, 112, 112));
  }
}
