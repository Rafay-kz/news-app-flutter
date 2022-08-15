import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/helper/news_data.dart';
import 'package:news_app/model/news_model.dart';

class CategoryScreenController extends GetxController{

  String categoryName=Get.arguments;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxList<ArticleModel> newsCategory=<ArticleModel>[].obs;


  @override
  void onInit() {
    super.onInit();
    fetchAllNews();
  }

  void fetchAllNews() async{
    newsCategory.value=await News().getCategoryNews(categoryName);
  }





}