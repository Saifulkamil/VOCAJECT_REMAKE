import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectLogbookDetail.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectLogbookModel.dart';
import 'package:http/http.dart' as http;

import '../../../controllers/fungsi_widget_random.dart';
import '../../../utils/baseUrl.dart';

class LogbookController extends GetxController {
  final widgetController = WidgetController();
  int? responseStatusCode;

  final TextEditingController logbookC = TextEditingController();
  final formkey = GlobalKey<FormState>();

  ProjectLogbookModel? projectLogbookModel;
  List<dynamic> listDatalogbook = [].obs;
  final selectedDate = DateTime.now().obs;
  dynamic projectId;
  dynamic idMember;
  dynamic roleUser;
  var isProjectLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();

    Map<String, dynamic>? args = Get.arguments;
    projectId = args!['projectId'];
    idMember = args['idMember'];
    idMember ??= args['idUser'];
    roleUser = args['roleUser'];

    getProjectLogbook();
  }

  Future<ProjectLogbookModel?> getProjectLogbook() async {
    Uri url =
        Uri.parse("${UrlDomain.baseurl}/api/project/$projectId/logbook/24");

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
        if (kDebugMode) {
          print("Error: ${response.reasonPhrase}");
        }
        return null; // Return null jika terjadi kesalahan
      }
    } catch (err) {
      if (kDebugMode) {
        print(" ini error ngak muncul project  $err");
      }
      // return List<Project>.empty();
    }
    return null;

    // Memeriksa status code response dari server
  }

  void selectDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(1945),
      lastDate: DateTime(2101),
    ).then((picked) {
      if (picked != null && picked != selectedDate.value) {
        selectedDate(picked);
      }
    });
  }

  Future<void> createProjectLogbook(DateTime date, String descripsi) async {
    widgetController.loading(Get.overlayContext!);

    String formattedDate = DateFormat('MM-dd-yyyy').format(selectedDate.value);
    Uri url =
        Uri.parse("${UrlDomain.baseurl}/api/project/$projectId/logbook/24");
    try {
      final response = await http.post(
        url,
        body: {
          "submited_at": formattedDate,
          "description": descripsi,
        },
      );
      Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 200) {
        ProjectLogbookDetail newlogBook =
            ProjectLogbookDetail.fromJson(data["data"]);
        listDatalogbook.add(newlogBook);

        responseStatusCode = null;
        responseStatusCode = response.statusCode;
        Timer(const Duration(milliseconds: 2000), () {
          isProjectLoaded.value = true;
        });
      } else {
         responseStatusCode = null;
        responseStatusCode = response.statusCode;
        // Jika status code bukan 200, bisa jadi terjadi kesalahan pada server
        if (kDebugMode) {
          print("Error: ${response.reasonPhrase}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
