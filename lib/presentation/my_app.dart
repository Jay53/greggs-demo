import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greggs/app/config/app_constants.dart';
import 'package:greggs/app/route/app_pages.dart';
import 'package:greggs/app/utils/scroll_behaviour.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyScrollBehavior(),
          child: child!,
        );
      },
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
