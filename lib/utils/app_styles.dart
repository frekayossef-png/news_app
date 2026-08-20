import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/app_colors.dart';

class AppStyles {
  static TextStyle medium20white = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );

  static TextStyle medium20blck = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
  static TextStyle medium14white = GoogleFonts.inter(
    fontSize: 14,

    fontWeight: FontWeight.w500,

    color: AppColors.whiteColor,
  );
  static TextStyle medium14black = GoogleFonts.inter(
    fontSize: 14,

    fontWeight: FontWeight.w500,

    color: AppColors.blackColor,
  );
  static TextStyle medium16black = GoogleFonts.inter(
    fontSize: 16,

    fontWeight: FontWeight.w500,

    color: AppColors.blackColor,
  );
  static TextStyle bold16wihte = GoogleFonts.inter(
    fontSize: 16,

    fontWeight: FontWeight.bold,

    color: AppColors.whiteColor,
  );
  static TextStyle medium12Gray = GoogleFonts.inter(
    fontSize: 12,

    fontWeight: FontWeight.w500,

    color: AppColors.greyColor,
  );
  static TextStyle medium24black = GoogleFonts.inter(
    fontSize: 24,

    fontWeight: FontWeight.w500,

    color: AppColors.blackColor,
  );
  static TextStyle medium24white = GoogleFonts.inter(
    fontSize: 24,

    fontWeight: FontWeight.w500,

    color: AppColors.whiteColor,
  );

  static TextStyle? get bold16black => null;
}
