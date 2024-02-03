import 'package:get/get.dart';

import '../controllers/project_history_controller.dart';

class ProjectHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectHistoryController>(
      () => ProjectHistoryController(),
    );
  }
}
