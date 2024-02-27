import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
   RxBool isHidden = true.obs;

  final TextEditingController emailC = TextEditingController(text: "husaini@gmail.com");
  final TextEditingController passC = TextEditingController(text: "vocaject");
  //  @override
  // void onInit() async {
  //   super.onInit();
  //   final box = GetStorage();

  //   // Corrected the syntax for writing data to GetStorage

  //   if (box.read('theme') != null) {
  //     // Adjusted the key to 'theme'
  //     var themeData = box.read('theme') as int;
  //     print(themeData);
  //   }
  // }
}
