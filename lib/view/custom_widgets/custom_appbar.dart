import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/custom_appbar_controller.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class CustomAppbar extends GetView<CustomAppbarController> {
  const CustomAppbar({Key? key, required this.categoryName}) : super(key: key);
final String categoryName;
  @override
  Widget build(BuildContext context) {
    return categoryName=='News Home Screen'?

      SizedBox(
      height: 100,
      width: Get.width,
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration:  BoxDecoration(
          gradient:
          const LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(kDarkAppBarColor),Color(kLightAppBarColor)]),
          color: const Color(kGreyColor),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              // spreadRadius: 0.,
              blurRadius: 5,
              offset: const Offset(1.0, 3.0), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: _wavy(),
          ),
        ),
      ),
    ):SizedBox(
      height: 100,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 40,left: 10,right: 10),
        child: Container(
          height: 80,
          decoration:  BoxDecoration(
            gradient:
            const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(kDarkAppBarColor),Color(kLightAppBarColor)]),
            color: const Color(kGreyColor),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                // spreadRadius: 0.,
                blurRadius: 5,
                offset: const Offset(1.0, 3.0), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(child: const Icon(Icons.arrow_back),
                onTap: (){
                  Get.back();

                },),
              ),
              SizedBox(width: Get.width/4,),
              Text(categoryName,  style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),),
            ],
          ),
        ),
      ),
    );
  }
  Widget _wavy(){
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 25.0,
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText('News Update',
              speed: const Duration(milliseconds: 200)),

        ],
        isRepeatingAnimation: true,
        repeatForever: true,
      ),
    );
  }



}
