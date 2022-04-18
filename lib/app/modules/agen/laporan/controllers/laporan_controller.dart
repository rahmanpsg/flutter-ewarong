import 'dart:math';

import 'package:e_warong/app/data/models/laporan_model.dart';
import 'package:get/get.dart';

class LaporanController extends GetxController {
  RxBool isLoading = true.obs;

  final List<String> bulanList = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];

  int tabIndex = DateTime.now().month - 1;

  RxList<LaporanModel> laporanList = <LaporanModel>[].obs;

  LaporanModel? laporanBulan(int bulan) =>
      laporanList.firstWhereOrNull((laporan) => laporan.bulan == bulan);

  @override
  void onInit() async {
    await Future.delayed(Duration(seconds: 1));

    isLoading.value = false;

    generateDumpData();

    super.onInit();
  }

  void generateDumpData() {
    for (var i = 0; i < 6; i++) {
      laporanList.add(LaporanModel(
          bulan: Random().nextInt(12),
          total: Random().nextInt(100),
          pendapatan: Random().nextInt(1000000)));
    }
  }
}
