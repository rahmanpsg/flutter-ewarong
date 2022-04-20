import 'package:get/get.dart';

class PengaturanController extends GetxController {
  RxBool isLoading = true.obs;

  RxBool isEdit = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void toggleEdit() {
    isEdit.value = !isEdit.value;
  }
}
