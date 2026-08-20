import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/size_utils.dart';

class ConfigItem extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ConfigItem({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.width * 0.05),
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.whiteColor, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: AppStyles.medium20white),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.arrow_drop_down_rounded,
              size: 35,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
