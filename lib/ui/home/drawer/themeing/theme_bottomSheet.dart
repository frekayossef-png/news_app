import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/ui/home/drawer/themeing/bloc/theme_cubit.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/size_utils.dart';

class ThemeBottomsheet extends StatelessWidget {
  final ThemeMode themeMode;
  const ThemeBottomsheet({super.key, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.25,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.whiteColor, width: 2),
            ),
            child: ListTile(
              title: Text(
                "light".tr(),
                style: TextStyle(color: AppColors.whiteColor),
              ),
              trailing: themeMode == ThemeMode.light
                  ? Icon(Icons.check_rounded, color: AppColors.whiteColor)
                  : null,
              onTap: () {
                context.read<ThemeCubit>().changeTheme(ThemeMode.light);
                Navigator.pop(context);
              },
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.whiteColor, width: 2),
            ),
            child: ListTile(
              title: Text(
                "dark".tr(),
                style: TextStyle(color: AppColors.whiteColor),
              ),
              trailing: themeMode == ThemeMode.dark
                  ? Icon(Icons.check_rounded, color: AppColors.whiteColor)
                  : null,
              onTap: () {
                context.read<ThemeCubit>().changeTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.whiteColor, width: 2),
            ),
            child: ListTile(
              title: Text(
                "system".tr(),
                style: TextStyle(color: AppColors.whiteColor),
              ),
              trailing: themeMode == ThemeMode.system
                  ? Icon(Icons.check_rounded, color: AppColors.whiteColor)
                  : null,
              onTap: () {
                context.read<ThemeCubit>().changeTheme(ThemeMode.system);
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}
