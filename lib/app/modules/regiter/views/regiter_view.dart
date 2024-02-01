import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/component/widget_appbar.dart';
import '../controllers/regiter_controller.dart';

class RegiterView extends GetView<RegiterController> {
  const RegiterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final registerC = Get.find<RegiterController>();
    
    
    return Scaffold(
      appBar: AppbarTransparant(title: "${registerC.Role}"),
      body: const Center(
        child: Text(
          'RegiterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
