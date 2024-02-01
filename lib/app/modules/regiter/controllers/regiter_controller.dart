import 'package:get/get.dart';

class RegiterController extends GetxController {
   String? Role;

  @override
  void onInit() {
    super.onInit();
    // menerima arguments dari page pick role
    Role = Get.arguments;
  }
}
