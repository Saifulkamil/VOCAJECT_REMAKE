import 'package:get/get.dart';

import '../controllers/project_progress_controller.dart';

class ProjectProgressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectProgressController>(
      () => ProjectProgressController(),
    );
  }
}
