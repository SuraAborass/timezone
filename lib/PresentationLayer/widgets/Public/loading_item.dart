import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

Widget loadingItem(bool isBlue, {double size = 40}) {
  return LottieBuilder.asset(
    isBlue
        ? "assets/images/loading-white.json"
        : "assets/images/loading-blue.json",
    height: size,
    width: size,
  );
}
