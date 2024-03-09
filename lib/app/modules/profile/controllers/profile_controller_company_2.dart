import 'package:get/get.dart';

import '../../project_progress/controllers/project_progress_controller.dart';

class ProfileControllerCompany2 extends GetxController {
  ProjectProgressController? dataProfil;

  var isProjectLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    dataProfil = Get.arguments;
    if (dataProfil != null) {
      isProjectLoaded.value = true;
    } else {
      return;
    }
  }
}
