import 'package:e_warong/app/data/models/sembako_model.dart';
import 'package:e_warong/app/modules/agen/views/form_sembako.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgenController extends GetxController {
  RxInt tabIndexSelected = 0.obs;

  RxList<SembakoModel> sembakoList = <SembakoModel>[].obs;

  // form sembako
  late final TextEditingController namaController;
  late final TextEditingController hargaController;
  late final TextEditingController stokController;

  @override
  void onInit() {
    namaController = TextEditingController();
    hargaController = TextEditingController();
    stokController = TextEditingController();

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

    super.onInit();
  }

  void changePage(int index) {
    tabIndexSelected.value = index;
  }

  void openFormSembako({
    required SembakoModel sembako,
    FormType formType = FormType.add,
  }) {
    namaController.text = sembako.nama;
    hargaController.text = formType == FormType.add ? "" : sembako.harga;
    stokController.text = formType == FormType.add ? "" : sembako.stok;

    Get.bottomSheet(
      FormSembako(sembakoModel: sembako, formType: formType),
      isScrollControlled: true,
    );
  }

  void addSembako(SembakoModel sembako) {
    sembako.setNama(namaController.text);
    sembako.setHarga(int.parse(hargaController.text));
    sembako.setStok(int.parse(stokController.text));

    sembakoList.add(sembako);

    clearForm();
    Get.back();
  }

  void editSembako(SembakoModel sembako) {
    sembako.setNama(namaController.text);
    sembako.setHarga(int.parse(hargaController.text));
    sembako.setStok(int.parse(stokController.text));

    final int index = sembakoList.indexOf(sembako);

    sembakoList[index] = sembako;

    clearForm();
    Get.back();
  }

  void clearForm() {
    namaController.clear();
    hargaController.clear();
    stokController.clear();
  }
}
