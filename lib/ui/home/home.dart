import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/model/category/category.dart';
import 'package:news_app/api/model/news_response/news_response.dart';
import 'package:news_app/ui/home/category_details/category_details.dart';
import 'package:news_app/ui/home/category_details/category_fragment/category_fragment.dart';
import 'package:news_app/ui/home/category_details/widget/main_error_widgrt.dart';
import 'package:news_app/ui/home/category_details/widget/main_loding_widget.dart';
import 'package:news_app/ui/home/category_details/widget/search_article_widget.dart';

import 'package:news_app/ui/home/drawer/drawer.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/size_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;
  String searchQuery = "";
  Future<NewsResponse>? searchFuture;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: context.height * (80 / 852),
        title: isSearching
            ? Container(
                height: context.height * (62 / 852),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.blackColor, width: 1),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 12),

                    Icon(Icons.search_rounded, color: AppColors.greyColor),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        onChanged: (value) {
                          searchQuery = value;
                        },
                        onSubmitted: (value) {
                          searchQuery = value;
                          searchFuture = ApiManager.searchNews(value);
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          hintText: "search".tr(),
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          isSearching = false;
                          searchQuery = "";
                          searchFuture = null;
                          selectedCategory = null;
                        });
                      },
                      icon: Icon(Icons.close_rounded),
                    ),
                  ],
                ),
              )
            : Text(
                selectedCategory == null
                    ? "home".tr()
                    : selectedCategory!.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

        actions: [
          if (!isSearching)
            IconButton(
              //todo: searsh her
              onPressed: () {
                setState(() {
                  isSearching = true;
                });
              },
              icon: Icon(Icons.search_outlined),
            ),
        ],
      ),

      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: DrawerBottum(onDrawerClick: onDrawerItemClick),
      ),
      body: searchFuture != null
          ? FutureBuilder<NewsResponse>(
              future: searchFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return MainLodingWidget();
                }

                if (snapshot.hasError) {
                  return MainErrorWidget(
                    errorMessage: "Something Went Wrong",
                    onPressed: () {
                      setState(() {
                        searchFuture = ApiManager.searchNews(searchQuery);
                      });
                    },
                  );
                }

                final articles = snapshot.data?.articles ?? [];

                if (articles.isEmpty) {
                  return Center(
                    child: Text(
                      "No results found",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return searchArticleWidget(article: articles[index]);
                  },
                );
              },
            )
          : selectedCategory == null
          ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
          : CategoryDetails(category: selectedCategory!),
    );
  }

  Category? selectedCategory;
  void onCategoryItemClick(Category newcategory) {
    // todo:newCategory => choes user
    selectedCategory = newcategory;
    setState(() {});
  }

  void onDrawerItemClick() {
    selectedCategory = null;
    isSearching = false;
    searchFuture = null;
    searchQuery = "";
    Navigator.pop(context);
    setState(() {});
  }
}
