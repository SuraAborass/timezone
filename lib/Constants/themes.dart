import 'package:flutter/material.dart';

import 'colors.dart';

class AppThemes{
  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.white,

  );


  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.black,

  );
  
}