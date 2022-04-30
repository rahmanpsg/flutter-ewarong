import 'package:e_warong/app/data/enums/user_type.dart';
import 'package:e_warong/app/data/models/api_response_model.dart';
import 'package:e_warong/app/data/models/pesanan_model.dart';
import 'package:e_warong/app/data/services/pesanan_service.dart';
import 'package:e_warong/app/modules/common/pesanan/controllers/pesanan_controller.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:get/get.dart';

class DetailPesananArguments {
  final UserType userType;
  final PesananModel pesanan;

  DetailPesananArguments({required this.userType, required this.pesanan});
}

class DetailPesananController extends GetxController {
  RxBool isLoading = false.obs;

  late final UserType userType;
  late final Rx<PesananModel> pesanan = PesananModel().obs;

  final PesananService _pesananService = PesananService();

  String? get fotoUrl {
    switch (userType) {
      case UserType.agen:
        return pesanan.value.masyarakat!.fotoUrl;
      case UserType.masyarakat:
        return pesanan.value.agen!.fotoUrl;
    }
  }

  String get title {
    switch (userType) {
      case UserType.agen:
        return pesanan.value.masyarakat!.nama!;
      case UserType.masyarakat:
        return pesanan.value.agen!.nama!;
    }
  }

  String get subtile {
    switch (userType) {
      case UserType.agen:
        return pesanan.value.masyarakat!.ktm.toString();
      case UserType.masyarakat:
        return pesanan.value.agen!.alamat!;
    }
  }

  @override
  void onInit() {
    initArguments();
    super.onInit();
  }

  void initArguments() {
    DetailPesananArguments args = Get.arguments as DetailPesananArguments;

    userType = args.userType;
    pesanan.value = args.pesanan;
  }

  void confirmPesanan(bool value) {
    final String _title = value ? 'menerima' : 'menolak';

    Get.defaultDialog(
      title: "Konfirmasi Pesanan",
      middleText: "Apakah anda yakin ingin $_title pesanan ini?",
      textConfirm: "Ya",
      textCancel: "Batal",
      buttonColor: secondaryColor,
      onConfirm: () {
        updatePesanan(value);
        Get.back();
      },
    );
  }

  void updatePesanan(bool value) async {
    isLoading.value = true;
    try {
      PesananModel _pesanan = PesananModel.fromJson(pesanan.value.toJson());

      if (userType == UserType.agen) {
        _pesanan.status = value;
      } else if (userType == UserType.masyarakat) {
        _pesanan.selesai = value;
      }

      await _pesananService.konfirmasi(userType, _pesanan.id!, _pesanan);

      if (userType == UserType.agen) {
        pesanan.value.status = value;
      } else if (userType == UserType.masyarakat) {
        pesanan.value.selesai = value;
      }

      pesanan.value.updatedAt = DateTime.now();

      Get.find<PesananController>().pesananList.refresh();
    } on ApiResponseModel catch (res) {
      print(res.data);
    }
    isLoading.value = false;
  }
}
