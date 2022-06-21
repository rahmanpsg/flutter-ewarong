import 'package:e_warong/app/data/models/api_response_model.dart';
import 'package:e_warong/app/data/models/user_model.dart';
import 'package:e_warong/app/data/services/auth_service.dart';
import 'package:e_warong/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  late final AuthService _authService;

  final formKey = GlobalKey<FormState>();
  final formAgenKey = GlobalKey<FormState>();

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

    super.dispose();
  }

  void login(String role) async {
    if (Get.isSnackbarOpen) return;

    if (role == 'user') {
      if (formKey.currentState?.validate() != true) return;
    } else {
      if (formAgenKey.currentState?.validate() != true) return;
    }

    isLoading.value = true;

    try {
      UserModel? _user;

      print(_user.toString());

      if (role == 'user') {
        _user = await _authService.login(
            kpmController.text, passMasyarakatController.text);
      } else if (role == 'agen') {
        _user = await _authService.loginAgen(
            usernameController.text, passAgenController.text);
      }

      if (_user != null) {
        if (_user.role == 'user') {
          Get.offAllNamed(Routes.USER, arguments: _user);
        } else if (_user.role == 'agen') {
          Get.offAllNamed(Routes.AGEN, arguments: _user);
        }
      }
    } on String catch (err) {
      Get.snackbar('Informasi', err);
    } on ApiResponseModel catch (res) {
      Get.snackbar('Informasi', res.errorMessage);
    }

    isLoading.value = false;
  }

  void register() {
    Get.back();
  }
}
