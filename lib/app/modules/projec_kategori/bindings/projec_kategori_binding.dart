import 'package:get/get.dart';

import '../controllers/projec_kategori_controller.dart';

class ProjecKategoriBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjecKategoriController>(
      () => ProjecKategoriController(),
    );
  }
}
