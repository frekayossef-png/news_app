import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/ui/home/drawer/language_bloc/language_cubit.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/size_utils.dart';

class LanguageBottomSheet extends StatelessWidget {
  final String language;

  const LanguageBottomSheet({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.2,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.whiteColor, width: 2),
            ),

            child: ListTile(
              title: Text("english".tr(), style: AppStyles.medium24white),
              trailing: language == "en"
                  ? const Icon(
                      Icons.check_rounded,
                      color: AppColors.whiteColor,
                      size: 27,
                    )
                  : null,
              onTap: () {
                context.read<LanguageCubit>().changeLanguage("en");
                context.setLocale(Locale("en"));
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(height: 13),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.whiteColor, width: 2),
            ),

            child: ListTile(
              title: Text("arabic".tr(), style: AppStyles.medium24white),
              trailing: language == "ar"
                  ? const Icon(
                      Icons.check_rounded,
                      color: AppColors.whiteColor,
                      size: 27,
                    )
                  : null,
              onTap: () {
                context.read<LanguageCubit>().changeLanguage("ar");
                context.setLocale(Locale("ar"));
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
