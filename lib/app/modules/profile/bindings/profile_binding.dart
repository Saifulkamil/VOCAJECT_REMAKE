import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/modules/profile/controllers/profile_controller_company_2.dart';
import 'package:vocaject_remake_v1/app/modules/profile/controllers/profile_controller_people.dart';

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
     Get.lazyPut<ProfileControllerCompany2>(
      () => ProfileControllerCompany2(),
    );
     Get.lazyPut<ProfileControllerPeople>(
      () => ProfileControllerPeople(),
    );
  }
}

