import 'dart:convert';

import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectLogbookModel.dart';
import 'package:http/http.dart' as http;

import '../../../utils/baseUrl.dart';

class LogbookController extends GetxController {
  ProjectLogbookModel? projectLogbookModel;
  List<dynamic> listDatalogbook = [].obs;

  dynamic projectId;
  dynamic idMember;
  // ProjectModelSingle ProjectSil
  // UserModel? userdata;
  // final user = GetStorage();

  var isProjectLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();

    Map<String, dynamic>? args = Get.arguments;

    projectId = args!['projectId'];
    print(projectId);
    idMember = args['idMember'];
    getProjectLogbook();
  }

  Future<ProjectLogbookModel?> getProjectLogbook() async {
    print("${UrlDomain.baseurl}/api/project/$projectId/logbook/$idMember");
    Uri url = Uri.parse(
        "${UrlDomain.baseurl}/api/project/$projectId/logbook/$idMember");

    try {
      final response = await http.get(url);
      Map<String, dynamic> data = json.decode(response.body);

      if (response.statusCode == 200) {
        // Pengecekan keberadaan kunci 'message' dan 'data'
        if (data.containsKey('message') && data.containsKey('data')) {
          // Deserialisasi JSON menjadi objek UserModel
          projectLogbookModel = ProjectLogbookModel.fromJson(data);
          listDatalogbook = projectLogbookModel!.data;
          isProjectLoaded.value = true;
          return projectLogbookModel;
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
      print(" ini error ngak muncul project  $err");
      // return List<Project>.empty();
    }
    return null;

    // Memeriksa status code response dari server
  }
}
