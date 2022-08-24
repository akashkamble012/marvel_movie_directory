import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class MyTheme {
  static final myTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.primaryLight,
    splashColor: AppColor.primary,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      backgroundColor: AppColor.secondary,
      elevation: 0,
      centerTitle: true,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColor.primary,
      primaryContainer: AppColor.primaryContainer,
      secondary: AppColor.secondary,
      background: AppColor.background,
    ),
  );
}
