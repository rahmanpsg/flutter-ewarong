import 'package:e_warong/app/data/models/user_model.dart';
import 'package:e_warong/app/data/services/user_service.dart';
import 'package:e_warong/app/modules/masyarakat/controllers/masyarakat_controller.dart';
import 'package:e_warong/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfilController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isEdit = false.obs;

  final RxString _password = ''.obs;
  final RxString _foto = ''.obs;

  String get password =>
      _password.value.isEmpty ? 'Klik untuk ubah' : _password.value;

  final UserService _userService = UserService();

  final UserModel masyarakat = Get.find<MasyarakatController>().user;

  @override
  void onInit() {
    super.onInit();
  }

  void logout() {
    GetStorage().erase();
    Get.offNamed(Routes.AUTH);
  }
}
