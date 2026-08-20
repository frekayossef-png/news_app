// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/model/category/category.dart';
import 'package:news_app/api/model/source_response/source_response.dart';
import 'package:news_app/ui/home/category_details/source/sources_widget.dart';
import 'package:news_app/ui/home/category_details/widget/main_error_widgrt.dart';
import 'package:news_app/ui/home/category_details/widget/main_loding_widget.dart';

class CategoryDetails extends StatefulWidget {
  final Category category;
  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManager.getSources(widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MainLodingWidget();
        } else if (snapshot.hasError) {
          //todo:error
          return MainErrorWidget(
            errorMessage: "Something Went Wrong",
            onPressed: () {
              ApiManager.getSources(widget.category.id);
              setState(() {});
            },
          );
        }
        //todo:server => responces => success
        //todo: responces => error
        if (snapshot.data!.status != 'ok') {
          return MainErrorWidget(
            errorMessage: snapshot.data!.message!,
            onPressed: () {
              ApiManager.getSources(widget.category.id);
              setState(() {});
            },
          );
        } else {
          ///todo: responces => success

          var sourcesList = snapshot.data?.sources ?? [];
          return sourcesList.isEmpty
              ? Center(
                  child: Text(
                    "No sources Item Found",

                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                )
              : SourcesWidget(sourcesList: sourcesList);
        }
      },
    );
  }
}
