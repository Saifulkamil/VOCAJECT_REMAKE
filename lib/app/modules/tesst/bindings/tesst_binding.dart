import 'package:get/get.dart';

import '../controllers/tesst_controller.dart';

class TesstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TesstController>(
      () => TesstController(),
    );
  }
}
