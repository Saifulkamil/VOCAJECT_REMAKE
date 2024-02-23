import 'package:get/get.dart';

import '../controllers/project_details_controller copy.dart';
import '../controllers/project_details_controller.dart';

class ProjectDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectDetailsController>(
      () => ProjectDetailsController(),
    );
    Get.lazyPut<ProjectDetailsPendingController>(
      () => ProjectDetailsPendingController(),
    );
  }
}
