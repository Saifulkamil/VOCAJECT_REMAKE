
import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectLogbookModel.dart';
import '../../../Models/MahasiswaDetails.dart';

class ListMhsLogbookController extends GetxController {
  // ProjectData? projectData;
  ProjectLogbookModel? projectLogbookModel;
  List<dynamic> listDataMembers = [].obs;
  List<MahasiswaDetails>? members;
  dynamic projectId;
  dynamic idMember;
  // ProjectModelSingle ProjectSil
  // UserModel? userdata;
  // final user = GetStorage();

  var isProjectLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();

    Map<String, dynamic>? args = Get.arguments;
    members = args!['members'];
    if (members != null) {
      // print(members![0]);
      isProjectLoaded.value = true;
    }
    projectId = args['projectId'];
    print(projectId);
    idMember = args['idMember'];
    idMember = args['memberId'];
  }
}
