import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vocaject_remake_v1/app/Models/ProjectModelSingle.dart';

import '../../../Models/ListMahasiswaModel.dart';
import '../../../controllers/fungsi_widget_random.dart';
import '../../../utils/baseUrl.dart';

class ProjectDetailsController extends GetxController {
  final widgetController = WidgetController();

  // Data proyek tunggal.
  ProjectModelSingle? dataCompany;
  // Status untuk menunjukkan apakah proses pengambilan data proyek sudah selesai atau belum.
  var isProjectLoaded = false.obs;

  List<int> selectedMahasiswa = [];
  int? idMahasiswa;
  File? file1;
  File? file2;
  String? mandatoryAttachmentError;
  String? studentIds;
  int? responseStatusCode;

  final TextEditingController noteC = TextEditingController();
  final formkey = GlobalKey<FormState>();

  // ID proyek yang akan ditampilkan.
  int? idProject;
  int? idCollege;
  int? idUser;

  void setFile1(String path) {
    String fileName = path.split('/').last;
    filePathLampiran1.value = fileName;
    isFilepath1.value = true;
  }

  void setFile2(String path) {
    String fileNam2 = path.split('/').last;
    filePathLampiran2.value = fileNam2;
    isFilepath2.value = true;
  }

  var isFilepath1 = false.obs;
  var filePathLampiran1 = "".obs;
  var isFilepath2 = false.obs;
  var filePathLampiran2 = "".obs;

  @override
  void onInit() {
    super.onInit();
    Map<String, dynamic>? args = Get.arguments;
    idProject = args!['idProject'];
    idCollege = args['idCollege'];
    idUser = args['idUser'];
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
          final dataProjetc = ProjectModelSingle.fromJson(data);

          dataCompany = dataProjetc;

          isProjectLoaded.value = true;
          return dataProjetc;
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

  Future<ListMahasiswaModel?> getUserMhsAccepted() async {
    Uri url = Uri.parse(
        "${UrlDomain.baseurl}/api/user/student/$idCollege?status=accepted");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final dataResponse = ListMahasiswaModel.fromJson(data);
        return dataResponse;
      } else {
        throw Exception('Failed to load data');
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

  void pilihFile1() async {
    FilePickerResult? filePick1 = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['jpg', 'pdf', 'doc']);

    if (filePick1 != null) {
      file1 = File(filePick1.files.first.path!);
      setFile1(file1!.path);
    }
  }

  Future<void> pilihFile2() async {
    FilePickerResult? filePick2 = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['jpg', 'pdf', 'doc']);

    if (filePick2 != null) {

      file2 = File(filePick2.files.first.path!);
      setFile2(file2!.path);
    }
  }

  Future<void> createProject(String note, List<int> idMahasiswa) async {
    widgetController.loading(Get.overlayContext!);

    Uri url = Uri.parse("${UrlDomain.baseurl}/api/project/$idProject/proposal");
    var request = http.MultipartRequest('POST', url);
    try {
      request.headers.addAll({
        'Accept': 'application/json',
        // 'Authorization': 'Bearer $token',
      });
      request.fields['note'] = note;
      request.fields['lecture_id'] = "$idUser";
      for (int i = 0; i < idMahasiswa.length; i++) {
        String fieldName = "student_ids[$i]";
        String fieldValue = idMahasiswa[i].toString();
        request.fields[fieldName] = fieldValue;
      }
      if (file1 != null) {
        var filewajib = await http.MultipartFile.fromPath(
          "mandatory_attachment",
          file1!.path,
        );
        request.files.add(filewajib);
      }

      if (file2 != null) {
        var fileoptional = await http.MultipartFile.fromPath(
          "additional2_attachment",
          file2!.path,
        );
        request.files.add(fileoptional);
      }
      var response = await request.send();
      responseStatusCode = null;
      responseStatusCode = response.statusCode;
      var responseData = await response.stream.bytesToString();
      Map<String, dynamic>? data = json.decode(responseData);
      // Mengakses pesan kesalahan "mandatory_attachment"
      if (data != null) {
        // Pastikan data tidak null sebelum mengaksesnya

        if (data.containsKey("data")) {
          // Periksa apakah kunci "data" ada dalam objek data

          if (data["data"].containsKey("student_ids")) {
            // Mengakses pesan kesalahan "student_ids"
            studentIds = data["data"]["student_ids"][0];
          } else if (data["data"].containsKey("mandatory_attachment")) {
            // Mengakses pesan kesalahan "mandatory_attachment"
            mandatoryAttachmentError = data["data"]["mandatory_attachment"][0];
          }
        }
      } else {
        // Tangani kasus jika data bernilai null
        if (kDebugMode) {
          print("Data response null");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
