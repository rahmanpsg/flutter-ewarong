import 'package:e_warong/app/data/models/api_response_model.dart';
import 'package:e_warong/app/data/models/laporan_model.dart';
import 'package:e_warong/app/data/models/user_model.dart';
import 'package:e_warong/app/data/services/laporan_service.dart';
import 'package:get/get.dart';

import '../../controllers/agen_controller.dart';

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
      laporanList.firstWhereOrNull((laporan) => laporan.bulan == bulan + 1);

  UserModel agen = Get.find<AgenController>().user;

  @override
  void onInit() async {
    await loadLaporan();

    super.onInit();
  }

  Future loadLaporan() async {
    isLoading.value = true;

    try {
      laporanList.value = await LaporanService().getAllAgen(agen.id!);
    } on ApiResponseModel catch (res) {
      print(res.message);
    }

    isLoading.value = false;
  }
}
