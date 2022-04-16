import 'package:get/get.dart';

import '../controllers/form_sembako_controller.dart';

class FormSembakoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormSembakoController>(
      () => FormSembakoController(),
    );
  }
}
