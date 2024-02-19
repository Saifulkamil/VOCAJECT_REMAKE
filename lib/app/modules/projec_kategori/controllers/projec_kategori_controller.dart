import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../Models/ProjectModel.dart';
import '../../../utils/baseUrl.dart';

class ProjecKategoriController extends GetxController {
  // Daftar proyek yang akan dimuat.
  List<dynamic> listProject = [].obs;

  // Status untuk menunjukkan apakah proses pengambilan data proyek sudah selesai atau belum.
  var isProjectLoaded = false.obs;

  // Argumen proyek yang diterima dari rute sebelumnya.
  Map<String, dynamic> argsProject = {};

  // Kategori proyek yang akan ditampilkan.
  String kategoriProject = "";

  // Slug dari kategori proyek.
  String slug = "";

  @override
  void onInit() {
    super.onInit();
    argsProject = Get.arguments;

    kategoriProject = argsProject["name"];
    slug = argsProject["slug"];
    getProjectByCategory();
  }


  // Mendapatkan daftar proyek berdasarkan kategori dari API.
  Future<ProjectModel?> getProjectByCategory() async {
    Uri url =
        Uri.parse("${UrlDomain.baseurl}/api/project?category=$slug");

    try {
      final response = await http.get(url);
      Map<String, dynamic> data = json.decode(response.body);

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
