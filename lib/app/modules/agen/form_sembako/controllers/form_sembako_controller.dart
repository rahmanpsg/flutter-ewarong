import 'dart:io';

import 'package:e_warong/app/data/models/api_response_model.dart';
import 'package:e_warong/app/data/models/sembako_model.dart';
import 'package:e_warong/app/data/models/user_model.dart';
import 'package:e_warong/app/data/services/sembako_service.dart';
import 'package:e_warong/app/modules/agen/controllers/agen_controller.dart';
import 'package:e_warong/app/modules/agen/sembako/controllers/sembako_controller.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FormSembakoController extends GetxController {
  RxBool isLoading = false.obs;

  late final FormType formType;
  late final SembakoModel sembako;

  late final TextEditingController namaController;
  late final TextEditingController hargaController;
  late final TextEditingController stokController;

  final RxList<SembakoModel> sembakoList =
      Get.find<SembakoController>().sembakoList;

  late final SembakoService _sembakoService = SembakoService();

  late final ImagePicker _picker = ImagePicker();
  XFile? image;
  RxString imagePath = ''.obs;

  UserModel agen = Get.find<AgenController>().user;

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
      text: sembako.harga != null ? sembako.harga.toString() : '',
    );
    stokController = TextEditingController(
      text: sembako.stok != null ? sembako.stok.toString() : '',
    );
  }

  void addSembako() async {
    isLoading.value = true;

    try {
      setData();
      SembakoModel _sembako = await _sembakoService.post(agen.id!, sembako);
      sembakoList.add(_sembako);
      Get.back();
    } on ApiResponseModel catch (res) {
      showSnackbar(res.errorMessage, true);
    }

    isLoading.value = false;
  }

  void editSembako() async {
    isLoading.value = true;

    try {
      setData();
      SembakoModel _sembako = await _sembakoService.put(sembako.id!, sembako);
      final int index = sembakoList.indexOf(sembako);
      sembakoList[index] = _sembako;
      Get.back();
    } on ApiResponseModel catch (res) {
      showSnackbar(res.errorMessage, true);
    }

    isLoading.value = false;
  }

  void setData() {
    try {
      sembako.nama = namaController.text;
      sembako.harga = int.parse(hargaController.text);
      sembako.stok = int.parse(stokController.text);
      if (image != null) {
        sembako.file = File(imagePath.value);
      }
    } catch (e) {
      print(e);
    }
  }

  void imagePicker() async {
    try {
      image = await _picker.pickImage(source: ImageSource.gallery);

      imagePath.value = image!.path;
    } catch (e) {
      print(e);
    }
  }

  void showSnackbar(String text, [bool error = false]) {
    Get.snackbar(
      'Informasi',
      text,
      snackPosition: SnackPosition.TOP,
      backgroundColor: error ? dangerColor : secondaryColor,
      colorText: Colors.white,
      borderRadius: 10,
      margin: EdgeInsets.all(10),
      snackStyle: SnackStyle.FLOATING,
    );
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
