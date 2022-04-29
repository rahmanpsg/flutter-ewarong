import 'package:e_warong/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfilController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  void logout() {
    GetStorage().erase();
    Get.offNamed(Routes.AUTH);
  }
}
