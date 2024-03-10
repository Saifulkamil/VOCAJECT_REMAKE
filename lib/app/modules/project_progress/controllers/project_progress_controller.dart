
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectData.dart';

import '../../../Models/UserModel.dart';

class ProjectProgressController extends GetxController {
  ProjectData? projectData;

  final user = GetStorage();
  UserModel? userdata;

  var isProjectLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    projectData = Get.arguments;
    if (projectData != null) {
      isProjectLoaded.value = true;
    }
    getUserFromStorage();
  }

  // fungsi untuk baca userModel dari GetStorage
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

  // Future<ProposalModel?> getProposalByIdAndProposalId() async {
  //   Uri url = Uri.parse(
  //       "${UrlDomain.baseurl}/api/project/${projectData!.id}/proposal/by_lecture/${userdata!.data.user.id}&proposal_status=accepted");

  //   try {
  //     final response = await http.get(url);
  //     Map<String, dynamic> data = json.decode(response.body);

  //     if (response.statusCode == 200) {
  //       // Pengecekan keberadaan kunci 'message' dan 'data'
  //       if (data.containsKey('message') && data.containsKey('data')) {
  //         // Deserialisasi JSON menjadi objek UserModel
  //         proposalData = ProposalModel.fromJson(data);

  //         // proposalData = dataProposal;
  //         // print(proposalData!.data.project.id);
  //         listpicture =  proposalData!.data.members;

  //         isProjectLoaded.value = true;
  //         return proposalData;
  //       } else {
  //         // Jika 'data' atau 'support' tidak ada, return null
  //         return null;
  //       }
  //     } else {
  //       // Jika status code bukan 200, bisa jadi terjadi kesalahan pada server
  //       if (kDebugMode) {
  //         print("Error: ${response.reasonPhrase}");
  //       }
  //       return null; // Return null jika terjadi kesalahan
  //     }
  //   } catch (err) {
  //     if (kDebugMode) {
  //       print(" ini error ngak muncul project  $err");
  //     }
  //     // return List<Project>.empty();
  //   }
  //   return null;

  //   // Memeriksa status code response dari server
  // }
}
