import 'package:get/get.dart';

class ProjecKategoriController extends GetxController {
   String? kategoriProject;

  @override
  void onInit() {
    super.onInit();
    kategoriProject = Get.arguments;
  }
}
