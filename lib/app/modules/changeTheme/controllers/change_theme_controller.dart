import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../utils/dark_theme.dart';
import '../../../utils/light_theme.dart';

class ChangeThemeController extends GetxController {
  late RxBool radioPick = false.obs;

  void toggleTheme(bool value) {
    radioPick.value = value;
    Get.changeTheme(radioPick.value == true ? darkTheme : lightTheme);
    final writeTheme = GetStorage();
    writeTheme.write('theme', radioPick.value);

    // Schedule the theme change after the current frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.changeTheme(radioPick.value == true ? darkTheme : lightTheme);
    });
  }

  @override
  void onInit() async {
    super.onInit();
    final readTheme = GetStorage();

    if (readTheme.read('theme') != null) {
      // Adjusted the key to 'theme'
      var themeData = readTheme.read('theme') as bool;
      radioPick.value = themeData;

      // Schedule the theme change after the current frame
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.changeTheme(radioPick.value == true ? darkTheme : lightTheme);
      });
    }
  }
}
