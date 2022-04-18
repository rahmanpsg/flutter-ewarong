import 'package:e_warong/app/data/models/sembako_model.dart';
import 'package:get/get.dart';

class AgenController extends GetxController {
  RxInt tabIndexSelected = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void changePage(int index) {
    tabIndexSelected.value = index;
  }
}
