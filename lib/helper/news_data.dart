import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/model/news_model.dart';

class News{

  static final News _instance = News._internal();
  News._internal();

  factory News() => _instance;

  Future <List<ArticleModel>> getNews() async{
    Response response=await get(Uri.parse('https://newsapi.org/v2/top-headlines?country=au&apiKey=436e97cfd18f4ec19ae57f011daf815f'));
    jsonDecode(response.body);
    Map newsData=jsonDecode(response.body);
      Iterable list=newsData["articles"];
      return list.map((e) =>ArticleModel.fromJson(e)).toList();
  }

  Future <List<ArticleModel>> getCategoryNews(String category) async{
    Response response=await get(Uri.parse('https://newsapi.org/v2/top-headlines?country=au&category=$category&apiKey=436e97cfd18f4ec19ae57f011daf815f'));
    jsonDecode(response.body);
    Map newsData=jsonDecode(response.body);
    Iterable list=newsData["articles"];
    return list.map((e) =>ArticleModel.fromJson(e)).toList();
  }


}