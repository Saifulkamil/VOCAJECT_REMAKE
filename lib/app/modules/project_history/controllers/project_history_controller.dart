import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../Models/ProjectModel.dart';
import '../../../Models/UserModel.dart';
import '../../../utils/baseUrl.dart';

class ProjectHistoryController extends GetxController {
  List<dynamic> listProject = [].obs;

  List<dynamic> proposalListDosenAcceptOnProgres = [].obs;
  List<dynamic> proposalListDosenPending = [].obs;
  List<dynamic> proposalListDosenReject = [].obs;
  List<dynamic> proposalListDosenselesai = [].obs;
  List<dynamic> proposalListMhsAcceptOnProgres = [].obs;
  List<dynamic> proposalListMhsPending = [].obs;
  List<dynamic> proposalListMhsselesai = [].obs;
  List<dynamic> proposalListindustriDankampusAcceptOnProgres = [].obs;
  List<dynamic> proposalListindustriDankampuspendding = [].obs;
  List<dynamic> proposalListindustriDankampusReject = [].obs;
  List<dynamic> proposalListindustriDankampusSelesai = [].obs;

  // Instance dari GetStorage untuk menyimpan data pengguna.
  final user = GetStorage();

  UserModel? userdata;
  String? urlApi;
  ProjectModel? projectdata;

  var isProjectLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();

    getUserFromStorage();
    // print("ini role user ${userdata!.data.user.role}");
    getFungsi();
  }

  void getFungsi() {
    if (userdata!.data.user.role == "lecture") {
      getProposal("${link["role"][0]}", "${link["status"][0]}",
          proposalListDosenAcceptOnProgres);
      getProposal("${link["role"][0]}", "${link["status"][1]}",
          proposalListDosenPending);
      getProposal("${link["role"][0]}", "${link["status"][2]}",
          proposalListDosenselesai);
      getProposal("${link["role"][0]}", "${link["status"][3]}",
          proposalListDosenReject);
      listProject.clear();
      listProject.addAll(proposalListDosenAcceptOnProgres);
    } else if (userdata!.data.user.role == "student") {
      getProposal("${link["role"][1]}", "${link["status"][0]}",
          proposalListMhsAcceptOnProgres);
      getProposal(
          "${link["role"][1]}", "${link["status"][3]}", proposalListMhsselesai);
      listProject.clear();
      listProject.addAll(proposalListMhsAcceptOnProgres);
    } else if (userdata!.data.user.role == "company") {
      getProposal("${link["role"][2]}", "${link["status"][0]}",
          proposalListindustriDankampusAcceptOnProgres);
      getProposal("${link["role"][2]}", "${link["status"][1]}",
          proposalListindustriDankampuspendding);
      getProposal("${link["role"][2]}", "${link["status"][2]}",
          proposalListindustriDankampusSelesai);
      getProposal("${link["role"][2]}", "${link["status"][3]}",
          proposalListindustriDankampusReject);
      listProject.clear();
      listProject.addAll(proposalListindustriDankampusAcceptOnProgres);
    } else {
      getProposal("${link["role"][3]}", "${link["status"][0]}",
          proposalListindustriDankampusAcceptOnProgres);
      getProposal("${link["role"][3]}", "${link["status"][1]}",
          proposalListindustriDankampuspendding);
      getProposal("${link["role"][3]}", "${link["status"][2]}",
          proposalListindustriDankampusSelesai);
      getProposal("${link["role"][3]}", "${link["status"][3]}",
          proposalListindustriDankampusReject);
      listProject.clear();
      listProject.addAll(proposalListindustriDankampusAcceptOnProgres);
    }
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

  final Map<String, dynamic> link = {
    "role": [
      "/api/project?lecture_id=",
      "/api/project?student_id=",
      "/api/project?company_id=",
      "/api/project?college_id="
    ],
    "status": [
      "&proposal_status=accepted&status=closed",
      "&proposal_status=panding&status=opened",
      "&proposal_status=accepted&status=completed",
      "&proposal_status=rejected",
    ]
  };

  Future<ProjectModel?> getProposal(
      String role, String status, List<dynamic> listProposal) async {
    // getFungsi();

    Uri url =
        Uri.parse("${UrlDomain.baseurl}$role${userdata!.data.user.id}$status");

    try {
      final response = await http.get(url);
      Map<String, dynamic> data = json.decode(response.body);

      if (response.statusCode == 200) {
        // Pengecekan keberadaan kunci 'message' dan 'data'

        if (data.containsKey('message') && data.containsKey('data')) {
          // Deserialisasi JSON menjadi objek UserModel
           projectdata = ProjectModel.fromJson(data);

          listProposal.clear(); // Menghapus data sebelum menyalin
          listProposal.addAll(projectdata!.data);

          if (userdata!.data.user.role == "lecture") {
            listProject.clear();
            listProject.addAll(proposalListDosenAcceptOnProgres);
          } else if (userdata!.data.user.role == "student") {
            listProject.clear();
            listProject.addAll(proposalListMhsAcceptOnProgres);
          } else if (userdata!.data.user.role == "company") {
            listProject.clear();
            listProject.addAll(proposalListindustriDankampusAcceptOnProgres);
          } else {
            listProject.clear();
            listProject.addAll(proposalListindustriDankampusAcceptOnProgres);
          }

          isProjectLoaded.value = true;
          // print(isProjectLoaded);
          return projectdata;
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
        print(" ini error ngak muncul porject history  $err");
      }
      // return List<Project>.empty();
    }
    return null;

    // Memeriksa status code response dari server
  }
}
