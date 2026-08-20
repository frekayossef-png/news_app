import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';

import 'package:news_app/api/model/news_response/news_response.dart';
import 'package:news_app/api/model/source_response/source.dart';
import 'package:news_app/ui/home/category_details/news/news_item.dart';
import 'package:news_app/ui/home/category_details/widget/main_error_widgrt.dart';
import 'package:news_app/ui/home/category_details/widget/main_loding_widget.dart';

import 'package:news_app/utils/size_utils.dart';

class NewsWidget extends StatefulWidget {
  final Source source;
  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNewsSourcesId(widget.source.id ?? ""),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MainLodingWidget();
        } else if (snapshot.hasError) {
          return MainErrorWidget(
            errorMessage: "somethin wentg wrong",
            onPressed: () {
              ApiManager.getNewsSourcesId(widget.source.id ?? "");
              setState(() {});
            },
          );
        }
        if (snapshot.data!.status != "ok") {
          return MainErrorWidget(
            errorMessage: snapshot.data!.message!,
            onPressed: () {
              ApiManager.getNewsSourcesId(widget.source.id ?? "");
              setState(() {});
            },
          );
        } else {
          var nwesList = snapshot.data!.articles ?? [];
          return nwesList.isEmpty
              ? Center(
                  child: Text(
                    "No News Item Found",

                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return NewsItem(article: nwesList[index]);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: context.height * 0.02);
                  },
                  itemCount: nwesList.length,
                );
        }
      },
    );
  }
}
