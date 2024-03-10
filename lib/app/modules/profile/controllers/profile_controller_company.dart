import 'package:get/get.dart';

import '../../../Models/ProjectsData.dart';



class ProfileControllerCompany extends GetxController {
  ProjectsData? projectData;
 

  var isProjectLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    projectData = Get.arguments;
    if (projectData != null) {
      isProjectLoaded.value = true;
    } else {
      return ;
    }
  }
}
