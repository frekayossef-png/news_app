import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:news_app/api/model/category/category.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/size_utils.dart';

class CotegoryItem extends StatelessWidget {
  final Category category;
  final int index;
  final String title;
  const CotegoryItem({
    super.key,
    required this.category,
    required this.index,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var isEven = (index % 2 == 0);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        alignment: isEven
            ? AlignmentDirectional.bottomEnd
            : AlignmentDirectional.bottomStart,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(category.image),
          ),
          Positioned(
            bottom: height * 0.15,
            right: isEven ? 40 : null,
            left: isEven ? null : 40,

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [Text(title, style: AppStyles.medium24white)],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.03,
            ),
            padding: EdgeInsetsDirectional.only(
              start: isEven ? width * 0.04 : 0,
              end: !isEven ? width * 0.04 : 0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              color: AppColors.greyColor,
            ),
            child: Row(
              textDirection: isEven ? TextDirection.ltr : TextDirection.rtl,
              mainAxisSize: MainAxisSize.min,
              spacing: width * 0.05,
              children: [
                Text(
                  "testViewAll".tr(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(
                    isEven
                        ? Icons.arrow_forward_ios_rounded
                        : Icons.arrow_back_ios_new_rounded,
                    color: Theme.of(context).splashColor,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
