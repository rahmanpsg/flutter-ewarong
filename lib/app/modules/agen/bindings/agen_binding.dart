import 'package:e_warong/app/modules/agen/laporan/controllers/laporan_controller.dart';
import 'package:e_warong/app/modules/agen/pengaturan/controllers/pengaturan_controller.dart';
import 'package:e_warong/app/modules/agen/sembako/controllers/sembako_controller.dart';
import 'package:get/get.dart';

import '../controllers/agen_controller.dart';
import '../pesanan/controllers/pesanan_controller.dart';

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
      () => PesananController(),
    );

    Get.lazyPut<LaporanController>(
      () => LaporanController(),
    );

    Get.lazyPut<PengaturanController>(
      () => PengaturanController(),
    );
  }
}
