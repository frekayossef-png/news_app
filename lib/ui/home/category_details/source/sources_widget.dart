// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:news_app/api/model/source_response/source.dart';
import 'package:news_app/ui/home/category_details/news/news_widget.dart';
import 'package:news_app/ui/home/category_details/source/source_tab.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/size_utils.dart';

class SourcesWidget extends StatefulWidget {
  final List<Source> sourcesList;

  const SourcesWidget({super.key, required this.sourcesList});

  @override
  State<SourcesWidget> createState() => _SourcesWidgetState();
}

class _SourcesWidgetState extends State<SourcesWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        spacing: context.height * 0.02,
        children: [
          TabBar(
            unselectedLabelColor:
                Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,

            labelStyle: Theme.of(context).textTheme.labelLarge,
            isScrollable: true,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            tabAlignment: TabAlignment.start,
            dividerColor: AppColors.transparentColor,
            indicatorColor: Theme.of(context).splashColor,
            tabs: widget.sourcesList.map((source) {
              return SourceTab(
                source: source,
                isSeleccted:
                    selectedIndex == widget.sourcesList.indexOf(source),
              );
            }).toList(),
          ),

          Expanded(
            child: NewsWidget(source: widget.sourcesList[selectedIndex]),
          ),
        ],
      ),
    );
  }
}
