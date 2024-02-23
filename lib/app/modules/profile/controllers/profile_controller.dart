import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../Models/UserModel.dart';

class ProfileController extends GetxController {
  // ProfileController? dataProfil;
  final user = GetStorage();
  UserModel? dataProfile;

  var isProjectLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    // dataProfil = Get.arguments;
    // if (dataProfil != null) {
    //   print(dataProfil);
    // } else {
    //   return print("kosong");
    // }
    getUserFromStorage();
  }

  // fungsi untuk baca userModel dari GetStorage
  UserModel? getUserFromStorage() {
    // Baca UserModel dari GetStorage dengan kunci yang sesuai, misalnya "user"
    final userJson = user.read('user');

    // Jika UserModel ditemukan, deserialisasi JSON menjadi UserModel
    if (userJson != null) {
      dataProfile = UserModel.fromJson(userJson);
      isProjectLoaded.value = true;

      return dataProfile;
    }
    return null; // Return null jika UserModel tidak ditemukan
  }
}
