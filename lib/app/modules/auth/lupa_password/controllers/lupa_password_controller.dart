import 'package:e_warong/app/data/models/api_response_model.dart';
import 'package:e_warong/app/data/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LupaPasswordController extends GetxController {
  final RxBool isLoading = false.obs;

  final AuthService _authService = AuthService();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController kpmController = TextEditingController();
  final TextEditingController telpController = TextEditingController();

  void kirim() async {
    if (formKey.currentState?.validate() != true) return;

    try {
      isLoading.value = true;

      final response = await _authService.lupaPassword(
          kpmController.text, telpController.text);

      if (response.error) {
        Get.snackbar(
          'Gagal',
          response.message,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Berhasil',
          response.message,
        );
      }
    } on String catch (err) {
      Get.snackbar('Informasi', err);
    } on ApiResponseModel catch (res) {
      Get.snackbar('Informasi', res.errorMessage);
    }

    isLoading.value = false;
  }
}
