import 'package:e_warong/app/data/enums/user_type.dart';
import 'package:e_warong/app/data/models/api_response_model.dart';
import 'package:e_warong/app/data/models/pesanan_model.dart';
import 'package:e_warong/app/data/models/user_model.dart';
import 'package:e_warong/app/data/services/pesanan_service.dart';
import 'package:e_warong/app/modules/agen/controllers/agen_controller.dart';
import 'package:e_warong/app/modules/agen/detail_pesanan/controllers/detail_pesanan_controller.dart';
import 'package:e_warong/app/modules/masyarakat/controllers/masyarakat_controller.dart';
import 'package:e_warong/app/routes/app_pages.dart';
import 'package:get/get.dart';

class PesananController<T extends GetxController> extends GetxController {
  final UserType userType;

  PesananController({required this.userType});

  RxBool isLoading = true.obs;

  RxList<PesananModel> pesananList = <PesananModel>[].obs;

  List<PesananModel> get pesanan =>
      pesananList.where((pesanan) => pesanan.status == null).toList();
  List<PesananModel> get pesananDitolak =>
      pesananList.where((pesanan) => pesanan.status == false).toList();
  List<PesananModel> get pesananDiterima =>
      pesananList.where((pesanan) => pesanan.status == true).toList();
  List<PesananModel> get pesananSelesai =>
      pesananList.where((pesanan) => pesanan.selesai == true).toList();

  final PesananService _pesananService = PesananService();

  UserModel get user {
    switch (userType) {
      case UserType.agen:
        return (Get.find<T>() as AgenController).user;
      case UserType.masyarakat:
        return (Get.find<T>() as MasyarakatController).user;
    }
  }

  String get pesananStrng {
    switch (userType) {
      case UserType.agen:
        return 'Masuk';
      case UserType.masyarakat:
        return 'Keluar';
    }
  }

  @override
  void onInit() async {
    await loadPesanan();

    isLoading.value = false;

    super.onInit();
  }

  Future loadPesanan() async {
    try {
      pesananList.addAll(await _pesananService.getAll(userType, user.id!));
    } on ApiResponseModel catch (res) {
      print(res);
    }
  }

  void toDetailPesanan(PesananModel pesanan) {
    Get.toNamed(
      Routes.DETAIL_PESANAN,
      arguments: DetailPesananArguments(pesanan: pesanan),
    );
  }
}
