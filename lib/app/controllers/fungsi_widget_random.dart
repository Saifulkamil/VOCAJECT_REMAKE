import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';

class WidgetController extends GetxController {
  // ignore: non_constant_identifier_names
  void Loading() {
    Get.defaultDialog(
      title: "Proses...",
      radius: 7,
      content: const Center(
          child: CircularProgressIndicator(
        color: greenColor,
      )),
    );
  }
}
