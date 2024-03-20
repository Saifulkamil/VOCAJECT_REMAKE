import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
   RxBool isHidden = true.obs;

  final TextEditingController emailC = TextEditingController(text: "informasi@pnl.ac.id");
  // final TextEditingController emailC = TextEditingController(text: "husaini@gmail.com");
  final TextEditingController passC = TextEditingController(text: "vocaject");

}
