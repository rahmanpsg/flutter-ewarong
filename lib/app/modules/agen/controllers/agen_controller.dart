import 'package:e_warong/app/data/models/sembako_model.dart';
import 'package:get/get.dart';

class AgenController extends GetxController {
  RxInt tabIndexSelected = 0.obs;

  RxList<SembakoModel> sembakoList = <SembakoModel>[].obs;

  @override
  void onInit() {
    loadDump();

    super.onInit();
  }

  void loadDump() {
    sembakoList.addAll([
      SembakoModel(
        id: "1",
        nama: "Terigu Karung 25KG",
        jenis: JenisSembako.beras,
        foto:
            "https://mitrabarusembako.com/wp-content/uploads/2021/09/IMG-20210324-WA0013.jpg",
        harga: 10000,
        stok: 5,
      ),
      SembakoModel(
        id: "2",
        nama: "Beras 25KG",
        jenis: JenisSembako.beras,
        harga: 6500,
        stok: 15,
      ),
    ]);
  }

  void changePage(int index) {
    tabIndexSelected.value = index;
  }
}
