import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectModel.dart';
import 'package:http/http.dart' as http;
import 'package:vocaject_remake_v1/app/Models/UserModel.dart';

import '../../../Models/MahasiswaDetails.dart';
import '../../../utils/baseUrl.dart';

class ProfileControllerPeople extends GetxController {
  MahasiswaDetails? dataProfil;
  List<dynamic> listProject = [].obs;
  final user = GetStorage();

  UserModel? idProject;
  var isProjectLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    dataProfil = Get.arguments;
    if (dataProfil != null) {
      isProjectLoaded.value = true;
    } else {
      return print("kosong");
    }
    getUserFromStorage();
  }

  // fungsi untuk baca userModel dari GetStorage
  UserModel? getUserFromStorage() {
    // Baca UserModel dari GetStorage dengan kunci yang sesuai, misalnya "user"
    final userJson = user.read('user');

    // Jika UserModel ditemukan, deserialisasi JSON menjadi UserModel
    if (userJson != null) {
      idProject = UserModel.fromJson(userJson);
      return idProject;
    }
    return null; // Return null jika UserModel tidak ditemukan
  }

  Future<ProjectModel?> getProject() async {
    Uri url =
        Uri.parse("${UrlDomain.baseurl}/api/project?student_id=$idProject");

    try {
      final response = await http.get(url);
      Map<String, dynamic> data = json.decode(response.body);
      // listProject = data["data"] as List<dynamic>;

      // print(ListProject);
      if (response.statusCode == 200) {
        // Pengecekan keberadaan kunci 'message' dan 'data'
        if (data.containsKey('message') && data.containsKey('data')) {
          // Deserialisasi JSON menjadi objek UserModel
          final projectData = ProjectModel.fromJson(data);

          listProject = projectData.data;

          isProjectLoaded.value = true;
          return projectData;
        } else {
          // Jika 'data' atau 'support' tidak ada, return null
          return null;
        }
      } else {
        // Jika status code bukan 200, bisa jadi terjadi kesalahan pada server
        print("Error: ${response.reasonPhrase}");
        return null; // Return null jika terjadi kesalahan
      }
    } catch (err) {
      print(" ini error ngak muncul porject  ${err}");
      // return List<Project>.empty();
    }
    return null;

    // Memeriksa status code response dari server
  }
}
