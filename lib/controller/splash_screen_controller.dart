import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/constants.dart';

class SplashScreenController extends GetxController{

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    _timer = Timer(const Duration(seconds: 5), () {
      _screenNavigation();
    });
  }


  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }


  void _screenNavigation()async{
      Get.offAllNamed(kHomeScreen);
  }

  void onScreenTap(){
    _timer.cancel();
    _screenNavigation();
  }
}