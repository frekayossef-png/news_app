// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/model/category/category.dart';
import 'package:news_app/ui/home/category_details/category_fragment/category_item/cotegory_item.dart';
import 'package:news_app/utils/size_utils.dart';

typedef onCategoryClick = void Function(Category);

class CategoryFragment extends StatelessWidget {
  final onCategoryClick onCategoryItemClick;
  final categoryNames = [
    "general".tr(),
    "business".tr(),
    "sports".tr(),
    "technology".tr(),
    "entertainment".tr(),
    "health".tr(),
    "science".tr(),
  ];
  CategoryFragment({super.key, required this.onCategoryItemClick});

  @override
  Widget build(BuildContext context) {
    var categoriesList = Category.getCategoryList(isDark: false);
    var height = context.height;
    var width = context.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: SingleChildScrollView(
        child: Column(
          spacing: height * 0.02,
          children: [
            Align(
              alignment: .topStart,
              child: Text(
                "welcomehome".tr(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onCategoryItemClick(categoriesList[index]);
                  },
                  child: CotegoryItem(
                    category: categoriesList[index],
                    index: index,
                    title: categoryNames[index],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: context.height * 0.02);
              },
              itemCount: categoriesList.length,
            ),
          ],
        ),
      ),
    );
  }
}
