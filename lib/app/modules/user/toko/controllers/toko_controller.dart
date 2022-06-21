import 'package:e_warong/app/data/models/api_response_model.dart';
import 'package:e_warong/app/data/models/toko_model.dart';
import 'package:e_warong/app/data/services/toko_service.dart';
import 'package:e_warong/app/modules/user/sembako/controllers/sembako_controller.dart';
import 'package:e_warong/app/routes/app_pages.dart';
import 'package:get/get.dart';

class TokoController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString errorMessage = ''.obs;

  final TokoService _tokoService = TokoService();

  final RxList<TokoModel> _tokoList = <TokoModel>[].obs;

  List<TokoModel> get tokoList => _tokoList;

  @override
  void onInit() {
    getAllToko();

    super.onInit();
  }

  Future getAllToko() async {
    isLoading.value = true;

    try {
      _tokoList.value = await _tokoService.getAll();
    } on ApiResponseModel catch (res) {
      isError.value = true;
      errorMessage.value = res.message;
    }

    isLoading.value = false;
  }

  void toSembako(TokoModel toko) {
    Get.toNamed(Routes.SEMBAKO, arguments: SembakoArguments(toko: toko));
  }
}
