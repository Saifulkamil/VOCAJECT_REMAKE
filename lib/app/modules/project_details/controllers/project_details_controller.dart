import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vocaject_remake_v1/app/Models/ProjectModelSingle.dart';

import '../../../utils/baseUrl.dart';

class ProjectDetailsController extends GetxController {

  // Data proyek tunggal.
  ProjectModelSingle? dataProject ;

  // Status untuk menunjukkan apakah proses pengambilan data proyek sudah selesai atau belum.
  var isProjectLoaded = false.obs;

  // ID proyek yang akan ditampilkan.
  int? idProject;

  @override
  void onInit() {
    super.onInit();
    idProject = Get.arguments;
      getProjectDetail();
  
  }

  // Mendapatkan detail proyek dari API.
  Future<ProjectModelSingle?> getProjectDetail() async {
    Uri url = Uri.parse("${UrlDomain.baseurl}/api/project/$idProject");

    try {
      final response = await http.get(url);
      Map<String, dynamic> data = json.decode(response.body);
      // listProject = data["data"] as List<dynamic>;

      // print(ListProject);
      if (response.statusCode == 200) {
        // Pengecekan keberadaan kunci 'message' dan 'data'
        if (data.containsKey('message') && data.containsKey('data')) {
          // Deserialisasi JSON menjadi objek UserModel
          final userdata = ProjectModelSingle.fromJson(data);

          dataProject = userdata ;

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
