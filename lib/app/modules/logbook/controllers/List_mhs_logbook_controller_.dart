import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectData.dart';
import '../../../Models/MahasiswaDetails.dart';

class ListMhsLogbookController extends GetxController {
  List<dynamic> listDataMembers = [].obs;
  List<MahasiswaDetails>? members;
  ProjectData? projectData;

  var isProjectLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    projectData = Get.arguments;
    if (projectData != null) {
      isProjectLoaded.value = true;
    }
  }
}
