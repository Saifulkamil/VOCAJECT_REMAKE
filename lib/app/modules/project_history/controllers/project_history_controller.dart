import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../Models/ProjectModel.dart';
import '../../../Models/UserModel.dart';
import '../../../utils/baseUrl.dart';

class ProjectHistoryController extends GetxController {
  List<dynamic> listProject = [].obs;

  // Instance dari GetStorage untuk menyimpan data pengguna.
  final user = GetStorage();

  UserModel? userdata;

  var isProjectLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    getUserFromStorage();
    getProposal();
  }

  // fungsi untuk baca userModel dari GetStorage
  UserModel? getUserFromStorage() {
    // Baca UserModel dari GetStorage dengan kunci yang sesuai, misalnya "user"
    final userJson = user.read('user');

    // Jika UserModel ditemukan, deserialisasi JSON menjadi UserModel
    if (userJson != null) {
      userdata = UserModel.fromJson(userJson);
      return userdata;
    }
    return null; // Return null jika UserModel tidak ditemukan
  }

  Future<ProjectModel?> getProposal() async {
    print(userdata!.data.user.id);
    Uri url = Uri.parse(
        "${UrlDomain.baseurl}/api/project?company_id=${userdata!.data.user.id}");

    try {
      final response = await http.get(url);
      Map<String, dynamic> data = json.decode(response.body);
      // listProject = data["data"] as List<dynamic>;

      // print(ListProject);
      if (response.statusCode == 200) {
        // Pengecekan keberadaan kunci 'message' dan 'data'
        if (data.containsKey('message') && data.containsKey('data')) {
          // Deserialisasi JSON menjadi objek UserModel
          final projectdata = ProjectModel.fromJson(data);

          listProject = projectdata.data;

          print(listProject.length);

          isProjectLoaded.value = true;
          return projectdata;
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
