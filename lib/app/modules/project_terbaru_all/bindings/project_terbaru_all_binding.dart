import 'package:get/get.dart';

import '../controllers/project_terbaru_all_controller.dart';

class ProjectTerbaruAllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectTerbaruAllController>(
      () => ProjectTerbaruAllController(),
    );
  }
}
