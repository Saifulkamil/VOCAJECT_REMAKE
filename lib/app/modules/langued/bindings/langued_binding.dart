import 'package:get/get.dart';

import '../controllers/langued_controller.dart';

class LanguedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguedController>(
      () => LanguedController(),
    );
  }
}
