
import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/Models/UserModel.dart';

import '../../../Models/MahasiswaDetails.dart';

class ProfileControllerPeople extends GetxController {
  MahasiswaDetails? mahasiswaDetails;

  UserModel? idProject;
  var isProjectLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    mahasiswaDetails = Get.arguments;
    if (mahasiswaDetails != null) {
      isProjectLoaded.value = true;
    } else {
      return;
    }
  }

}
