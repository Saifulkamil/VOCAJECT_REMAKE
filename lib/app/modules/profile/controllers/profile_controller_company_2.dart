import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectData.dart';


class ProfileControllerCompany2 extends GetxController {
  ProjectData? dataProfil;

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
