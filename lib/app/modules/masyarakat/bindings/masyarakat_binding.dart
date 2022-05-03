import 'package:e_warong/app/data/enums/user_type.dart';
import 'package:e_warong/app/modules/common/pengaturan/controllers/pengaturan_controller.dart';
import 'package:get/get.dart';

import '../../common/pesanan/controllers/pesanan_controller.dart';
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

    Get.lazyPut<PesananController>(
      () => PesananController<MasyarakatController>(
        userType: UserType.masyarakat,
      ),
    );

    Get.lazyPut<PengaturanController>(
      () => PengaturanController<MasyarakatController>(
          userType: UserType.masyarakat),
    );
  }
}
