import 'package:get/get.dart';

import '../controllers/target_project_controller.dart';

class TargetProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TargetProjectController>(
      () => TargetProjectController(),
    );
  }
}
