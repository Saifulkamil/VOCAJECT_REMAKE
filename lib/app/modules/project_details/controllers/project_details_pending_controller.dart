import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectData.dart';
import 'package:vocaject_remake_v1/app/Models/UserModel.dart';

class ProjectDetailsPendingController extends GetxController {
  // Data proyek tunggal.
  ProjectData? projectData;

  UserModel? userdata;
  final user = GetStorage();

  // Status untuk menunjukkan apakah proses pengambilan data proyek sudah selesai atau belum.
  var isProjectLoaded = false.obs;

  // ID proyek yang akan ditampilkan.
  int? idProject;

  @override
  void onInit() {
    super.onInit();
    projectData = Get.arguments;
    if (projectData != null) {
      isProjectLoaded.value = true;
    }
    getUserFromStorage();
  }

  UserModel? getUserFromStorage() {
    // Baca UserModel dari GetStorage dengan kunci yang sesuai, misalnya "user"
    final userJson = user.read('user');

    // Jika UserModel ditemukan, deserialisasi JSON menjadi UserModel
    if (userJson != null) {
      userdata = UserModel.fromJson(userJson);
      // print(" ini id user ${userdata!.data.user.id}");

      return userdata;
    }
    return null; // Return null jika UserModel tidak ditemukan
  }
}
