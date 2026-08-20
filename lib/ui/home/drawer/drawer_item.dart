import 'package:flutter/material.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/size_utils.dart';

class DrawerItem extends StatelessWidget {
  final String iconName;
  final String text;
  const DrawerItem({super.key, required this.iconName, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.04),
      child: Row(
        spacing: context.width * 0.04,
        children: [
          Image.asset(iconName),
          Text(text, style: AppStyles.medium20white),
        ],
      ),
    );
  }
}
