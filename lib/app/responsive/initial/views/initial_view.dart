import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../responsive_layout.dart';
import '../controllers/initial_controller.dart';

class InitialView extends GetView<InitialController> {
  const InitialView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const ResponsiveView();
  }
}
