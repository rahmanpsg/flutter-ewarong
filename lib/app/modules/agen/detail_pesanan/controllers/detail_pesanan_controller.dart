import 'package:e_warong/app/data/models/pesanan_model.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:get/get.dart';

import '../../../common/pesanan/controllers/pesanan_controller.dart';

class DetailPesananController extends GetxController {
  late final Rx<PesananModel> pesanan = PesananModel().obs;

  // final List<PesananModel> pesananMasuk =
  //     Get.find<AgenController>().pesananMasuk;

  @override
  void onInit() {
    initArguments();
    super.onInit();
  }

  void initArguments() {
    DetailPesananArguments args = Get.arguments as DetailPesananArguments;

    pesanan.value = args.pesanan;
  }

  @override
  void onClose() {}

  void confirmPesanan(bool status) {
    final String _title = status ? 'menerima' : 'menolak';

    Get.defaultDialog(
      title: "Konfirmasi Pesanan",
      middleText: "Apakah anda yakin ingin $_title pesanan ini?",
      textConfirm: "Ya",
      textCancel: "Batal",
      buttonColor: secondaryColor,
      onConfirm: () {
        pesanan.value.status = status;

        pesanan.refresh();
        Get.find<PesananController>().pesananList.refresh();
        Get.back();
      },
    );
  }
}

class DetailPesananArguments {
  final PesananModel pesanan;

  DetailPesananArguments({required this.pesanan});
}
