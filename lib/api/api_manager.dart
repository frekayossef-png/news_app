// ignore_for_file: strict_top_level_inference

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constant.dart';
import 'package:news_app/api/model/en_point.dart';
import 'package:news_app/api/model/news_response/news_response.dart';

import 'package:news_app/api/model/source_response/source_response.dart';

class ApiManager {
  static Future<SourceResponse> getSources(String categoryId) async {
    try {
      Uri url = Uri.https(ApiConstant.nameApi, EnPoint.sourcesApi, {
        "apiKey": ApiConstant.apiKey,
        "category": categoryId,
      });

      var response = await http.get(url);

      return SourceResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsResponse> getNewsSourcesId(String sourcesId) async {
    try {
      Uri url = Uri.https(ApiConstant.nameApi, EnPoint.topHeadLinesApi, {
        "apiKey": ApiConstant.apiKey,
        "sources": sourcesId,
        "pageSize": "20",
      });

      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsResponse> searchNews(String query) async {
    try {
      Uri url = Uri.https(ApiConstant.nameApi, EnPoint.sourcesnewsApi, {
        "apiKey": ApiConstant.apiKey,
        "q": query,
        "searchIn": "content",
      });

      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}

//// https://newsapi.org/v2/top-headlines/sources?apiKey=f69117f6c52849b184818308b6b13943;
///https://newsapi.org/v2/everything?domains=techcrunch.com,thenextweb.com&apiKey=f69117f6c52849b184818308b6b13943,
