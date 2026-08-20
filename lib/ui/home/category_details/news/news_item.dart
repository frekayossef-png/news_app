import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/api/model/news_response/article.dart';
import 'package:news_app/ui/home/category_details/news/news_web_veiw.dart';
import 'package:news_app/ui/home/category_details/widget/main_loding_widget.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/size_utils.dart';

class NewsItem extends StatefulWidget {
  final Article article;

  const NewsItem({super.key, required this.article});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;

    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: AppColors.transparentColor,
          context: context,
          builder: (context) {
            return Container(
              margin: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Theme.of(context).splashColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: widget.article.urlToImage ?? "",
                        placeholder: (context, url) => MainLodingWidget(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),

                    Text(
                      widget.article.content ?? "",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),

                    InkWell(
                      onTap: () {
                        //todo:here is click page news sours
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return NewsWebVeiw(url: widget.article.url!);
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 56,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            "View Full Article",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 0.04),
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.02,
          vertical: height * 0.01,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).splashColor, width: 2),
        ),
        child: Column(
          spacing: context.height * 0.02,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: widget.article.urlToImage ?? "",
                placeholder: (context, url) => MainLodingWidget(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),

            Text(
              widget.article.title ?? "",
              style: Theme.of(context).textTheme.labelLarge,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "By: ${widget.article.author}",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),

                Text(
                  DateFormat(
                    "dd/MM/yyyy",
                  ).format(DateTime.parse(widget.article.publishedAt ?? "")),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
