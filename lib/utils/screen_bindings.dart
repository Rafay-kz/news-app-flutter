import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:news_app/controller/category_screen_controller.dart';
import 'package:news_app/controller/home_screen_controller.dart';
import 'package:news_app/controller/splash_screen_controller.dart';

class ScreenBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => CategoryScreenController());
    Get.lazyPut(() => SplashScreenController());
  }


}