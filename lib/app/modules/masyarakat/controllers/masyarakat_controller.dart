import 'package:e_warong/app/data/models/pesanan_model.dart';
import 'package:e_warong/app/data/models/user_model.dart';
import 'package:get/get.dart';

class MasyarakatController extends GetxController {
  RxInt tabIndexSelected = 0.obs;

  late final UserModel user;

  RxList<PesananModel> pesananList = <PesananModel>[].obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      user = Get.arguments as UserModel;
    }

    super.onInit();
  }

  void changePage(int index) {
    tabIndexSelected.value = index;
  }
}
