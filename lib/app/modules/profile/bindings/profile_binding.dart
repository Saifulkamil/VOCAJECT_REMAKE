import 'package:get/get.dart';

import '../controllers/profile_controller.dart';
import '../controllers/profile_controller_company.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
     Get.lazyPut<ProfileControllerCompany>(
      () => ProfileControllerCompany(),
    );
  }
}

