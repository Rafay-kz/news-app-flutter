import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:news_app/controller/splash_screen_controller.dart';
import 'package:news_app/utils/app_colors.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.onScreenTap,
      child: Scaffold(
        backgroundColor: const Color(0xFFD7CCC8),
       body:

       Column(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           const Text('News App', style: TextStyle(
             fontSize: 40.0,
             color: Colors.black,
             fontWeight: FontWeight.bold,
             shadows: [
               Shadow(
                 blurRadius: 10.0,
                 color: Colors.grey,
                 offset: Offset(5.0, 5.0),
               ),
               Shadow(
                 color: Colors.brown,
                 blurRadius: 10.0,
                 offset: Offset(-5.0, 5.0),
               ),
             ],
             letterSpacing: -1.0,
             wordSpacing: 5.0,
           ),),
           Container(
             width: Get.width,
             height: 500,
             decoration: const BoxDecoration(
                 image: DecorationImage(
                     image: AssetImage(
                         "assets/images/splash_screen.png"
                     ),
                     fit: BoxFit.contain
                 )
             ),
             padding: const EdgeInsets.only(top: 80),


           ),

         ],
       ),
      ),
    );
  }
}
