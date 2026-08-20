// ignore_for_file: camel_case_types

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/api/model/news_response/article.dart';
import 'package:news_app/ui/home/category_details/widget/main_loding_widget.dart';
import 'package:news_app/utils/size_utils.dart';

class searchArticleWidget extends StatelessWidget {
  final Article article;

  const searchArticleWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.01,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).splashColor, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        spacing: height * 0.02,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? "",
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => MainLodingWidget(),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error_outline_rounded),
            ),
          ),

          Text(
            article.title ?? '',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "By: ${article.author ?? ""}",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              Text(
                article.publishedAt == null
                    ? ""
                    : DateFormat(
                        "dd/MM/yyyy",
                      ).format(DateTime.parse(article.publishedAt!)),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
