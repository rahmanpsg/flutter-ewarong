import 'package:get/get.dart';

import '../controllers/agen_controller.dart';
import '../pesanan/controllers/pesanan_controller.dart';

class AgenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgenController>(
      () => AgenController(),
    );

    Get.lazyPut<PesananController>(
      () => PesananController(),
    );
  }
}
