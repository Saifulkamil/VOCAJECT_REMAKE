import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:vocaject_remake_v1/app/Models/ProjectModel.dart';
import 'package:vocaject_remake_v1/app/Models/UserModel.dart';

import '../../../utils/baseUrl.dart';

class HomeController extends GetxController {
  List<dynamic> listProject = [].obs;
  UserModel? userdata;
  final user = GetStorage();

  // loading untuk mengGet data dari fungsi GetProject
  var isProjectLoaded = false.obs;

  // late List<ProjectModel> item ;

  @override
  Future<void> onInit() async {
    super.onInit();
    getProject();
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

  Future<ProjectModel?> getProject() async {
    Uri url =
        Uri.parse("${UrlDomain.baseurl}/api/project?status=opened&latest=true");

    try {
      final response = await http.get(url);
      Map<String, dynamic> data = json.decode(response.body);
      // listProject = data["data"] as List<dynamic>;

      // print(ListProject);
      if (response.statusCode == 200) {
        // Pengecekan keberadaan kunci 'message' dan 'data'
        if (data.containsKey('message') && data.containsKey('data')) {
          // Deserialisasi JSON menjadi objek UserModel
          final userdata = ProjectModel.fromJson(data);

          listProject = userdata.data;

          isProjectLoaded.value = true;
          return userdata;
        } else {
          // Jika 'data' atau 'support' tidak ada, return null
          return null;
        }
      } else {
        // Jika status code bukan 200, bisa jadi terjadi kesalahan pada server
        if (kDebugMode) {
          print("Error: ${response.reasonPhrase}");
        }
        return null; // Return null jika terjadi kesalahan
      }
    } catch (err) {
      if (kDebugMode) {
        print(" ini error ngak muncul porject  $err");
      }
      // return List<Project>.empty();
    }
    return null;

    // Memeriksa status code response dari server
  }
}
