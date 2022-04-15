import 'package:e_warong/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // masyarakat
  late final TextEditingController kpmController;
  late final TextEditingController passMasyarakatController;

  // agen
  late final TextEditingController usernameController;
  late final TextEditingController passAgenController;

  @override
  void onInit() {
    kpmController = TextEditingController();
    passMasyarakatController = TextEditingController();

    usernameController = TextEditingController();
    passAgenController = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    kpmController.dispose();
    passMasyarakatController.dispose();
    super.onClose();
  }

  void login() {
    Get.offNamed(Routes.AGEN);
  }

  void register() {
    Get.back();
  }
}
