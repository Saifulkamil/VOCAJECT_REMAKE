import 'package:get/get.dart';
import '../../../Models/MahasiswaDetails.dart';

class ListMhsLogbookController extends GetxController {
  List<dynamic> listDataMembers = [].obs;
  List<MahasiswaDetails>? members;
  dynamic projectId;

  var isProjectLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();

    Map<String, dynamic>? args = Get.arguments;
    projectId = args!['projectId'];
    members = args['members'];
    if (members != null) {
      isProjectLoaded.value = true;
    }
  }
}
