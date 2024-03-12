import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectData.dart';
import 'package:http/http.dart' as http;

import '../../../Models/ProjectsData.dart';
import '../../../Models/UserModel.dart';
import '../../../utils/baseUrl.dart';

class ProjectProgressController extends GetxController {
  ProjectData? projectData;
  ProjectsData? projectsData;

  final user = GetStorage();
  UserModel? userdata;

  var isProjectLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    projectData = Get.arguments;
    getUserFromStorage();
    getprojectByid();
  }

  // fungsi untuk baca userModel dari GetStorage
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

  Future<ProjectsData?> getprojectByid() async {
    Uri url = Uri.parse("${UrlDomain.baseurl}/api/project/${projectData!.id}");

    try {
      final response = await http.get(url);
      Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 200) {
        isProjectLoaded.value = true;
        // Pengecekan keberadaan kunci 'message' dan 'data'
        if (data.containsKey('message') && data.containsKey('data')) {
          projectsData = ProjectsData.fromJson(data["data"]);

          return projectsData;
        } else {
          // Jika 'data' atau 'support' tidak ada, return null
          return null;
        }
      } else {
        // Jika status code bukan 200, bisa jadi terjadi kesalahan pada server
      }
    } catch (err) {
      // return List<Project>.empty();
    }
    return null;
  }

  // Metode untuk refresh data
  Future<void> refreshData() async {
    isProjectLoaded.value = false; // Set nilai isProjectLoaded kembali ke false
    await getprojectByid(); // Panggil kembali metode untuk mendapatkan data
  }
}
