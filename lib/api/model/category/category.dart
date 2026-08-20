import 'package:news_app/utils/app_assets.dart';

class Category {
  String id;
  String image;
  String title;

  Category({required this.id, required this.image, required this.title});

  static List<Category> getCategoryList({required bool isDark}) {
    return [
      // business
      // entertainment
      // general
      // health
      // science
      // sports
      // technology,
      Category(
        id: "general",
        image: isDark
            ? AppAssets.generalLightImage
            : AppAssets.generalDarkImage,
        title: "General",
      ),

      Category(
        id: "business",
        image: isDark ? AppAssets.busniessLight : AppAssets.busniessDark,
        title: "Business",
      ),

      Category(
        id: "sports",
        image: isDark ? AppAssets.spotLightImage : AppAssets.sportDarkImage,
        title: "Sports",
      ),

      Category(
        id: "technology",
        image: isDark
            ? AppAssets.technologyLightImage
            : AppAssets.technologyDarkImage,
        title: "Technology",
      ),

      Category(
        id: "entertainment",
        image: isDark
            ? AppAssets.entertainmentLightImage
            : AppAssets.entertainmentDarkImage,
        title: "Entertainment",
      ),

      Category(
        id: "health",
        image: isDark ? AppAssets.helthLightImage : AppAssets.helthDarkImage,
        title: "Health",
      ),

      Category(
        id: "science",
        image: isDark
            ? AppAssets.scienceLightImage
            : AppAssets.scienceDarkImage,
        title: "Science",
      ),
    ];
  }
}
