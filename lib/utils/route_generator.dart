import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/utils/screen_bindings.dart';
import 'package:news_app/view/screens/category_screen.dart';
import 'package:news_app/view/screens/home_screen.dart';
import 'package:news_app/view/screens/splash_screen.dart';

class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: kHomeScreen,
        page: () => const HomeScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kCategoryScreen,
        page: () => const CategoryScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kSplashScreen,
        page: () => const SplashScreen(),
        binding: ScreenBindings(),
      ),



    ];
  }


}