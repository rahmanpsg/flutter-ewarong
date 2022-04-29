import 'package:e_warong/app/data/models/api_response_model.dart';
import 'package:e_warong/app/data/models/pesanan_model.dart';
import 'package:e_warong/app/data/models/sembako_model.dart';
import 'package:e_warong/app/data/models/user_model.dart';
import 'package:e_warong/app/data/services/pesanan_service.dart';
import 'package:e_warong/app/data/services/user_service.dart';
import 'package:e_warong/app/modules/masyarakat/controllers/masyarakat_controller.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailSembakoController extends GetxController {
  RxBool isLoading = true.obs;

  late final SembakoModel sembako;
  late final UserModel agen;

  RxInt jumlah = 1.obs;

  final PesananService _pesananService = PesananService();

  final UserModel? masyarakat = Get.find<MasyarakatController>().user;

  late PesananModel pesanan;

  @override
  void onInit() async {
    DetailSembakoArguments args = Get.arguments as DetailSembakoArguments;

    sembako = args.sembako;
    await getAgen();

    pesanan = PesananModel(
      agen: agen,
      masyarakat: masyarakat,
      sembako: sembako,
    );

    super.onInit();
  }

  Future getAgen() async {
    try {
      agen = await UserService().getUser(sembako.agen!);
    } on ApiResponseModel catch (res) {
      print(res.message);
    }

    isLoading.value = false;
  }

  void substractJumlah() {
    if (jumlah.value == 1) return;
    jumlah.value = jumlah.value - 1;
  }

  void addJumlah() {
    if (jumlah.value == sembako.stok) return;
    jumlah.value = jumlah.value + 1;
  }

  void pesan() {
    Get.defaultDialog(
      title: 'Informasi',
      middleText: 'Pesanan akan dikirim?',
      textConfirm: "Oke",
      textCancel: "Batal",
      onConfirm: () {
        sendPesanan();
        Get.back();
      },
    );
  }

  void sendPesanan() async {
    pesanan.jumlah = jumlah.value;

    print(pesanan.toJson());

    try {
      PesananModel _pesanan = await _pesananService.post(pesanan);

      print(_pesanan);
      showSnackbar('Pesanan berhasil dikirim');
    } on ApiResponseModel catch (res) {
      showSnackbar(res.errorMessage, true);
    }
  }

  void showSnackbar(String text, [bool error = false]) {
    Get.snackbar(
      'Informasi',
      text,
      snackPosition: SnackPosition.TOP,
      backgroundColor: error ? dangerColor : secondaryColor,
      colorText: Colors.white,
      borderRadius: 10,
      margin: EdgeInsets.all(10),
      snackStyle: SnackStyle.FLOATING,
    );
  }
}

class DetailSembakoArguments {
  final SembakoModel sembako;

  DetailSembakoArguments({required this.sembako});
}