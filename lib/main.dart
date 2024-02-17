import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vocaject_remake_v1/app/utils/dark_theme.dart';
// import 'package:vocaject_remake_v1/app/utils/dark_theme.dart';
import 'package:vocaject_remake_v1/app/utils/light_theme.dart';
import 'app/modules/splash/controllers/splash_controller.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  Get.put<SplashController>(SplashController());

    await GetStorage.init();
  final readTheme = GetStorage();
  
  // Baca tema dari penyimpanan lokal
  bool? savedTheme = readTheme.read('theme') as bool?;

  // Tentukan tema berdasarkan nilai yang dibaca
  ThemeData theme = savedTheme == true ? darkTheme : lightTheme;

  runApp(
    GetMaterialApp(
      theme: theme,
      darkTheme: theme,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

