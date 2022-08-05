import 'package:e_warong/app/data/enums/user_type.dart';
import 'package:e_warong/app/modules/common/profil/controllers/profil_controller.dart';
import 'package:e_warong/app/modules/user/toko/controllers/toko_controller.dart';
import 'package:get/get.dart';

import '../../common/pesanan/controllers/pesanan_controller.dart';
import '../controllers/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(
      () => UserController(),
    );

    Get.lazyPut<TokoController>(
      () => TokoController(),
    );

    Get.lazyPut<PesananController>(
      () => PesananController<UserController>(
        userType: UserType.user,
      ),
    );

    Get.lazyPut<ProfilController>(
      () => ProfilController<UserController>(userType: UserType.user),
    );
  }
}
