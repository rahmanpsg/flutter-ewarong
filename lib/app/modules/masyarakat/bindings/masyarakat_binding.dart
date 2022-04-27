import 'package:get/get.dart';

import '../controllers/masyarakat_controller.dart';
import '../sembako/controllers/sembako_controller.dart';

class MasyarakatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MasyarakatController>(
      () => MasyarakatController(),
    );

    Get.lazyPut<SembakoController>(
      () => SembakoController(),
    );
  }
}
