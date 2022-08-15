import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/helper/category_data.dart';
import 'package:news_app/helper/news_data.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/utils/constants.dart';

class HomeScreenController extends GetxController{

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<CategoryModel> categories=<CategoryModel>[];
  RxList<ArticleModel> news=<ArticleModel>[].obs;
  RxBool showContainer=false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllNews();
    categories=CategoryData().getCategories();

  }

  void fetchAllNews() async{
    news.value=await News().getNews();
   showContainer.value=true;
  }


  CategoryTap(int i){
    Get.toNamed(kCategoryScreen,arguments: categories[i].categoryName);

  }



}