import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/utils/route_generator.dart';
import 'package:news_app/utils/screen_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(
            textScaleFactor:
            data.textScaleFactor > 1.2 ? 1.2 : data.textScaleFactor*1.05,
          ),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      title: kAppName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      initialBinding: ScreenBindings(),
      getPages: RouteGenerator.getPages(),
      initialRoute: kSplashScreen,
    );
  }
}
