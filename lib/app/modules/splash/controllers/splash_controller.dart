import 'package:e_warong/app/data/models/api_response_model.dart';
import 'package:e_warong/app/data/models/user_model.dart';
import 'package:e_warong/app/data/services/auth_service.dart';
import 'package:e_warong/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void cekLogin(Duration duration) async {
    try {
      UserModel _user = await AuthService().verifyToken();

      if (_user.role == 'masyarakat') {
        Get.offAllNamed(Routes.MASYARAKAT, arguments: _user);
      } else if (_user.role == 'agen') {
        Get.offAllNamed(Routes.AGEN, arguments: _user);
      }
      return;
    } on ApiResponseModel catch (res) {
      print(res.message);
    }

    Get.toNamed(Routes.AUTH);
  }
}
