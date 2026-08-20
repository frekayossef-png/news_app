import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.whiteColor,

    splashColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarThemeData(
      backgroundColor: AppColors.whiteColor,
      iconTheme: IconThemeData(color: AppColors.blackColor),

      centerTitle: true,
    ),
    textTheme: TextTheme(
      labelLarge: AppStyles.bold16black,
      labelSmall: AppStyles.medium12Gray,
      labelMedium: AppStyles.medium14black,
      bodyMedium: AppStyles.medium14white,
      headlineLarge: AppStyles.medium20blck,
      headlineMedium: AppStyles.medium24black,
      headlineSmall: AppStyles.medium14black,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.blackColor,

    splashColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarThemeData(
      backgroundColor: AppColors.blackColor,
      iconTheme: IconThemeData(color: AppColors.whiteColor),

      centerTitle: true,
    ),
    textTheme: TextTheme(
      labelLarge: AppStyles.bold16wihte,
      labelSmall: AppStyles.medium12Gray,
      labelMedium: AppStyles.medium14white,
      bodyMedium: AppStyles.medium14black,
      headlineLarge: AppStyles.medium20white,
      headlineMedium: AppStyles.medium24white,
      headlineSmall: AppStyles.medium14white,
    ),
  );
}
