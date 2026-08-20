// ignore_for_file: unused_local_variable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/ui/home/drawer/language_bloc/language_bottom_sheet.dart';
import 'package:news_app/ui/home/drawer/language_bloc/language_cubit.dart';
import 'package:news_app/ui/home/drawer/themeing/bloc/theme_cubit.dart';
import 'package:news_app/ui/home/drawer/config_item.dart';
import 'package:news_app/ui/home/drawer/divider_item.dart';
import 'package:news_app/ui/home/drawer/drawer_item.dart';
import 'package:news_app/ui/home/drawer/themeing/theme_bottomSheet.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/size_utils.dart';

class DrawerBottum extends StatelessWidget {
  final VoidCallback onDrawerClick;
  const DrawerBottum({super.key, required this.onDrawerClick});

  @override
  Widget build(BuildContext context) {
    var width = context.widget;
    var height = context.height;
    return Column(
      spacing: context.height * 0.02,
      children: [
        Container(
          alignment: .center,
          width: double.infinity,
          height: context.height * 0.20,
          color: AppColors.whiteColor,
          child: Text("News App", style: AppStyles.medium24black),
        ),
        InkWell(
          onTap: () {
            //todo:
            onDrawerClick();
          },
          child: DrawerItem(iconName: AppAssets.home1, text: "goToHome".tr()),
        ),
        DividerItem(),
        InkWell(
          onTap: () {
            //todo:theme
          },

          child: DrawerItem(iconName: AppAssets.iconTheme, text: "theme".tr()),
        ),
        BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return ConfigItem(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: AppColors.blackColor,
                  context: context,
                  builder: (context) {
                    return ThemeBottomsheet(themeMode: themeMode);
                  },
                );
              },
              text: themeMode == ThemeMode.dark
                  ? "dark".tr()
                  : themeMode.isLight
                  ? "light".tr()
                  : "system".tr(),
            );
          },
        ),
        DividerItem(),
        InkWell(
          onTap: () {
            //todo:language
          },

          child: DrawerItem(
            iconName: AppAssets.iconLangu,
            text: "language".tr(),
          ),
        ),

        BlocBuilder<LanguageCubit, String>(
          builder: (context, language) {
            return ConfigItem(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: AppColors.blackColor,
                  context: context,
                  builder: (context) {
                    return LanguageBottomSheet(language: language);
                  },
                );

                //todo: show language bottom sheet
              },
              text: language == "en" ? "english".tr() : "arabic".tr(),
            );
          },
        ),
      ],
    );
  }
}
