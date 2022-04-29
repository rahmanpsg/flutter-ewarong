import 'package:e_warong/app/data/enums/user_type.dart';
import 'package:get/get.dart';

import '../../common/pesanan/controllers/pesanan_controller.dart';
import '../controllers/masyarakat_controller.dart';
import '../sembako/controllers/sembako_controller.dart';
import '../profil/controllers/profil_controller.dart';

class MasyarakatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MasyarakatController>(
      () => MasyarakatController(),
    );

    Get.lazyPut<SembakoController>(
      () => SembakoController(),
    );

    Get.lazyPut<ProfilController>(
      () => ProfilController(),
    );

    Get.lazyPut<PesananController>(
      () => PesananController<MasyarakatController>(
        userType: UserType.masyarakat,
      ),
    );
  }
}
