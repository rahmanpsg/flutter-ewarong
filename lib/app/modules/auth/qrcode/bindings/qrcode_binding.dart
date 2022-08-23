import 'package:get/get.dart';

import '../controllers/qrcode_controller.dart';

class QrcodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrcodeController>(
      () => QrcodeController(),
    );
  }
}
