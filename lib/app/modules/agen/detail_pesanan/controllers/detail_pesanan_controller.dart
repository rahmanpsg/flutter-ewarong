import 'package:e_warong/app/data/models/pesanan_model.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:get/get.dart';

class DetailPesananController extends GetxController {
  Rx<PesananModel> pesanan = PesananModel().obs;

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
    Get.defaultDialog(
      title: "Konfirmasi Pesanan",
      middleText: "Apakah anda yakin ingin mengkonfirmasi pesanan ini?",
      textConfirm: "Ya",
      textCancel: "Batal",
      buttonColor: secondaryColor,
      onConfirm: () {
        pesanan.value.status = status;
        pesanan.value.jumlah = 5;
        // update();
        Get.back();
      },
      // confirmTextColor: primaryColor,
      // cancelTextColor: dangerColor,
    );
  }
}

class DetailPesananArguments {
  final PesananModel pesanan;

  DetailPesananArguments({required this.pesanan});
}
