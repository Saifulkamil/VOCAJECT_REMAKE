import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/responsive/mobile/mobile_1.dart';
import 'package:vocaject_remake_v1/app/responsive/mobile/mobile_2.dart';
import 'package:vocaject_remake_v1/app/responsive/mobile/mobile_3.dart';
import 'package:vocaject_remake_v1/app/responsive/mobile/mobile_4.dart';
import 'package:vocaject_remake_v1/app/responsive/mobile/mobile_5.dart';


class ResponsiveView extends GetView<StatelessWidget> {
  const ResponsiveView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // screen 360×800
        if (constraints.maxWidth < 360 || constraints.maxHeight < 800) {
          return const Mobile1();
          // screen  390×844
        } else if (constraints.maxWidth < 390 || constraints.maxHeight < 844) {
          return const Mobile2();
          // screen  414×896
        } else if (constraints.maxWidth < 393 || constraints.maxHeight < 873) {
          return const Mobile3();
          // screen 393×873
        } else if (constraints.maxWidth < 414 || constraints.maxHeight < 896) {
          return const Mobile4();
          // screen 412×915
        } else if (constraints.maxWidth < 412 || constraints.maxHeight < 915) {
          return const Mobile5();
        } else {
          return const Center();
        }
      },
    );
  }
}
