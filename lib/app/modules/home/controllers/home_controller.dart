import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vocaject_remake_v1/app/Models/ProjectModel.dart';

import '../../../utils/baseUrl.dart';

class HomeController extends GetxController {
  List<dynamic> listProject = [].obs;

  // loading untuk mengGet data dari fungsi GetProject
  var isProjectLoaded = false.obs;

  // late List<ProjectModel> item ;

  @override
  Future<void> onInit() async {
    super.onInit();
    getProject();
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
