import 'package:e_warong/app/data/models/sembako_model.dart';
import 'package:e_warong/app/modules/agen/stok_sembako/controllers/stok_sembako_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormSembakoController extends GetxController {
  late final FormType formType;
  late final SembakoModel sembako;

  late final TextEditingController namaController;
  late final TextEditingController hargaController;
  late final TextEditingController stokController;

  final RxList<SembakoModel> sembakoList =
      Get.find<StokSembakoController>().sembakoList;

  @override
  void onInit() {
    initArguments();
    initForm();

    super.onInit();
  }

  @override
  void onClose() {
    namaController.dispose();
    hargaController.dispose();
    stokController.dispose();
    super.onClose();
  }

  void initArguments() {
    FormSembakoArguments args = Get.arguments as FormSembakoArguments;

    formType = args.formType;
    sembako = args.sembako;
  }

  void initForm() {
    namaController = TextEditingController(text: sembako.nama);
    hargaController = TextEditingController(
      text: sembako.harga == "0" ? '' : sembako.harga,
    );
    stokController = TextEditingController(
      text: sembako.stok == "0" ? '' : sembako.stok,
    );
  }

  void addSembako() {
    setData();
    sembakoList.add(sembako);
    Get.back();
  }

  void editSembako() {
    setData();
    final int index = sembakoList.indexOf(sembako);
    sembakoList[index] = sembako;
    Get.back();
  }

  void setData() {
    sembako.setNama(namaController.text);
    sembako.setHarga(int.parse(hargaController.text));
    sembako.setStok(int.parse(stokController.text));
  }
}

enum FormType { add, edit }

class FormSembakoArguments {
  final FormType formType;
  final SembakoModel sembako;

  FormSembakoArguments({
    this.formType = FormType.add,
    required this.sembako,
  });
}
