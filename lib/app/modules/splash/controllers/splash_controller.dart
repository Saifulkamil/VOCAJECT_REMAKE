import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../views/splash_screen_view.dart';

class SplashController extends GetxController {
  final splash = GetStorage();
  
   @override
  void onReady() {
    super.onReady();

    
    if (splash.read('theme') == null) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        Get.to(()=>const SplashScreenView());
          // Get.offAllNamed(Routes.NAVIGATIONBAR);

      });
          // Get.offAllNamed(Routes.NAVIGATIONBAR);

    } else {
          Get.offAllNamed(Routes.NAVIGATIONBAR);

      // if (splash.read('dataUser') != null) {
      //   Future.delayed(const Duration(milliseconds: 2000), () {
      //     final data = splash.read('dataUser') as Map<String, dynamic>;
      //     var role = data["role"];
      //     if (role == "student") {
      //       Get.offAllNamed(Routes.NAVBARUSERMHS);
      //     } else if (role == "lecture") {
      //       Get.offAllNamed(Routes.NAVBARUSERDOSEN);
      //     } else if (role == "company") {
      //       Get.offAllNamed(Routes.NAVBARUSERINDUSTRI);
      //     } else if (role == "college") {
      //       Get.offAllNamed(Routes.NAVBARUSERKAMPUS);
      //     }
      //   });
      // } else {
      //   Future.delayed(const Duration(milliseconds: 1000), () {
      //     Get.offAllNamed(Routes.NAVBARNOSER);
      //   });
      }
    }
  }
// }
