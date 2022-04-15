import 'package:get/get.dart';

import '../controllers/agen_controller.dart';

class AgenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgenController>(
      () => AgenController(),
    );
  }
}
