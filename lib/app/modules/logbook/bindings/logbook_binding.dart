import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/modules/logbook/controllers/List_mhs_logbook_controller_.dart';

import '../controllers/logbook_controller.dart';

class LogbookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogbookController>(
      () => LogbookController(),
    );
    Get.lazyPut<ListMhsLogbookController>(
      () => ListMhsLogbookController(),
    );
    
  }
}
