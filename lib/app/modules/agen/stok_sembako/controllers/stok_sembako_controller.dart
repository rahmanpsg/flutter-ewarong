import 'dart:math';

import 'package:e_warong/app/data/models/sembako_model.dart';
import 'package:get/get.dart';

class StokSembakoController extends GetxController {
  RxList<SembakoModel> sembakoList = <SembakoModel>[].obs;

  @override
  void onInit() {
    generateDumpData();

    super.onInit();
  }

  void generateDumpData() {
    for (var i = 0; i < 10; i++) {
      sembakoList.add(
        SembakoModel(
          id: i.toString(),
          nama: 'Sembako $i',
          stok: Random().nextInt(100),
          harga: Random().nextInt(100000),
        ),
      );
    }
  }
}
