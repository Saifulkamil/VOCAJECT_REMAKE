import 'package:get/get.dart';

import '../controllers/regiter_controller.dart';

class RegiterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegiterController>(
      () => RegiterController(),
    );
  }
}
