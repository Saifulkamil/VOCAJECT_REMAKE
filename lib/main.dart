import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:vocaject_remake_v1/app/utils/dark_theme.dart';
import 'package:vocaject_remake_v1/app/utils/light_theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: lightTheme,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
