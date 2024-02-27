import 'dart:convert';

import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectTaskModel.dart';
import 'package:http/http.dart' as http;

import '../../../Models/ProjectData.dart';
import '../../../utils/baseUrl.dart';

class TargetProjectController extends GetxController {
  ProjectData? projectData;
  ProjectTaskModel? ProjectTaskData;
  List<dynamic> listProjectTask = [].obs;

  // ProjectModelSingle ProjectSil
  // UserModel? userdata;
  // final user = GetStorage();

  var isProjectLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    projectData = Get.arguments;
    getProjectTask();
    // getProposalByIdAndProposalId();
  }

  Future<ProjectTaskModel?> getProjectTask() async {
    Uri url =
        Uri.parse("${UrlDomain.baseurl}/api/project/${projectData!.id}/task");

    try {
      final response = await http.get(url);
      Map<String, dynamic> data = json.decode(response.body);

      if (response.statusCode == 200) {
        // Pengecekan keberadaan kunci 'message' dan 'data'
        if (data.containsKey('message') && data.containsKey('data')) {
          // Deserialisasi JSON menjadi objek UserModel
          ProjectTaskData = ProjectTaskModel.fromJson(data);
          listProjectTask = ProjectTaskData!.data;
          isProjectLoaded.value = true;
          return ProjectTaskData;
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
      print(" ini error ngak muncul project  ${err}");
      // return List<Project>.empty();
    }
    return null;

    // Memeriksa status code response dari server
  }
}
