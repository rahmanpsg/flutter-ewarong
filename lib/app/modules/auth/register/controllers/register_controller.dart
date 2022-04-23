import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late final TextEditingController nikController;
  late final TextEditingController namaController;
  late final TextEditingController namaTokoController;
  late final TextEditingController alamatController;

  @override
  void onInit() {
    nikController = TextEditingController();
    namaController = TextEditingController();
    namaTokoController = TextEditingController();
    alamatController = TextEditingController();

    super.onInit();
  }

  void register() {}
}
