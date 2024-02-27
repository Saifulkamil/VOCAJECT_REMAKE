import 'package:get/get.dart';

import '../../../Models/ProjectModelSingle.dart';


class ProfileControllerCompany extends GetxController {
  ProjectModelSingle? dataProfil;
 

  var isProjectLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    dataProfil = Get.arguments;
    if (dataProfil != null) {
      print(dataProfil);
      isProjectLoaded.value = true;
    } else {
      return print("kosong");
    }
  }
}