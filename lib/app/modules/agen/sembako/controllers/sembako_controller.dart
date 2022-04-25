import 'package:e_warong/app/data/models/api_response_model.dart';
import 'package:e_warong/app/data/models/sembako_model.dart';
import 'package:e_warong/app/data/models/user_model.dart';
import 'package:e_warong/app/data/services/sembako_service.dart';
import 'package:e_warong/app/modules/agen/controllers/agen_controller.dart';
import 'package:get/get.dart';

class SembakoController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString errorMessage = ''.obs;

  RxList<SembakoModel> sembakoList = <SembakoModel>[].obs;

  late final SembakoService _sembakoService;

  UserModel? agen = Get.find<AgenController>().user;

  @override
  void onInit() {
    _sembakoService = SembakoService();
    getAllSembako();

    super.onInit();
  }

  void getAllSembako() async {
    isLoading.value = true;
    try {
      sembakoList.value = await _sembakoService.getAll(agen!.id);
    } on ApiResponseModel catch (res) {
      isError.value = true;
      errorMessage.value = res.message;
    }

    isLoading.value = false;
  }
}
