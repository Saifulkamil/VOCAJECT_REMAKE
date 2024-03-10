import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectData.dart';

class ProjectDetailsPendingController extends GetxController {
  // Data proyek tunggal.
  ProjectData? projectData;

  // Status untuk menunjukkan apakah proses pengambilan data proyek sudah selesai atau belum.
  var isProjectLoaded = false.obs;

  // ID proyek yang akan ditampilkan.
  int? idProject;

  @override
  void onInit() {
    super.onInit();
    projectData = Get.arguments;
    if (projectData != null) {
      isProjectLoaded.value = true;
    }
    // getProjectDetail();
  }
}
