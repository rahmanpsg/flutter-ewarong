import 'package:e_warong/app/data/enums/user_type.dart';
import 'package:e_warong/app/modules/agen/laporan/controllers/laporan_controller.dart';
import 'package:e_warong/app/modules/agen/pengaturan/controllers/pengaturan_controller.dart';
import 'package:e_warong/app/modules/agen/sembako/controllers/sembako_controller.dart';
import 'package:get/get.dart';

import '../../common/pesanan/controllers/pesanan_controller.dart';
import '../controllers/agen_controller.dart';

class AgenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgenController>(
      () => AgenController(),
    );

    Get.lazyPut<SembakoController>(
      () => SembakoController(),
    );

    Get.lazyPut<PesananController>(
      () => PesananController<AgenController>(
        userType: UserType.agen,
      ),
    );

    Get.lazyPut<LaporanController>(
      () => LaporanController(),
    );

    Get.lazyPut<PengaturanController>(
      () => PengaturanController(),
    );
  }
}
