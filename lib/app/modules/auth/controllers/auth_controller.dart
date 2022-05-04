import 'package:e_warong/app/data/models/api_response_model.dart';
import 'package:e_warong/app/data/models/user_model.dart';
import 'package:e_warong/app/data/services/auth_service.dart';
import 'package:e_warong/app/routes/app_pages.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  late final AuthService _authService;

  // masyarakat
  late final TextEditingController kpmController;
  late final TextEditingController passMasyarakatController;

  // agen
  late final TextEditingController usernameController;
  late final TextEditingController passAgenController;

  @override
  void onInit() {
    _authService = AuthService();

    kpmController = TextEditingController();
    passMasyarakatController = TextEditingController();

    usernameController = TextEditingController();
    passAgenController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    kpmController.dispose();
    passMasyarakatController.dispose();

    usernameController.dispose();
    passAgenController.dispose();

    Get.delete<AuthController>();

    super.dispose();
  }

  void login(String role) async {
    if (validateFormLogin(role) == false) return;
    if (Get.isSnackbarOpen) return;

    isLoading.value = true;

    try {
      UserModel? _user;

      if (role == 'masyarakat') {
        _user = await _authService.login(
            kpmController.text, passMasyarakatController.text);
      } else if (role == 'agen') {
        _user = await _authService.loginAgen(
            usernameController.text, passAgenController.text);
      }

      if (_user != null) {
        if (_user.role == 'masyarakat') {
          Get.offAllNamed(Routes.MASYARAKAT, arguments: _user);
        } else if (_user.role == 'agen') {
          Get.offAllNamed(Routes.AGEN, arguments: _user);
        }
      }
    } on ApiResponseModel catch (res) {
      Get.snackbar('Informasi', res.errorMessage);
    }

    isLoading.value = false;
  }

  void register() {
    Get.back();
  }

  bool validateFormLogin(String role) {
    if (role == 'masyarakat') {
      if (kpmController.text.isEmpty || passMasyarakatController.text.isEmpty) {
        Get.snackbar('Informasi', 'Nomor KPM dan Password tidak boleh kosong');

        return false;
      }
    } else if (role == 'agen') {
      if (usernameController.text.isEmpty || passAgenController.text.isEmpty) {
        Get.snackbar('Informasi', 'Username dan Password tidak boleh kosong');

        return false;
      }
    }

    return true;
  }
}
