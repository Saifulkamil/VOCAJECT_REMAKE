import 'package:get/get.dart';

import '../controllers/change_theme_controller.dart';

class ChangeThemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangeThemeController>(
      () => ChangeThemeController(),
    );
  }
}
