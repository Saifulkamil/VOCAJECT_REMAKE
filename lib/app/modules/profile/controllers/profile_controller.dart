import 'package:get/get.dart';


class ProfileController extends GetxController {
  ProfileController? dataProfil;
 

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
