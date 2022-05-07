import 'package:get/get.dart';

import '../controllers/detail_sembako_controller.dart';

class DetailSembakoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailSembakoController>(
      () => DetailSembakoController(),
    );
  }
}
