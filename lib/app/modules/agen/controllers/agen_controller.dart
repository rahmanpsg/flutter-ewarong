import 'package:e_warong/app/data/models/user_model.dart';
import 'package:get/get.dart';

class AgenController extends GetxController {
  late final UserModel user;
  RxInt tabIndexSelected = 0.obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      user = Get.arguments as UserModel;
    }

    super.onInit();
  }

  void changePage(int index) {
    tabIndexSelected.value = index;
  }
}
