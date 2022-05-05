import 'package:e_warong/app/data/models/api_response_model.dart';
import 'package:e_warong/app/data/models/user_model.dart';
import 'package:e_warong/app/data/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;

  late final AuthService _authService;

  late final GlobalKey<FormState> formKey;

  late final TextEditingController nikController;
  late final TextEditingController namaController;
  late final TextEditingController alamatController;
  late final TextEditingController telponController;
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void onInit() {
    _authService = AuthService();

    formKey = GlobalKey<FormState>();

    nikController = TextEditingController();
    namaController = TextEditingController();
    alamatController = TextEditingController();
    telponController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    nikController.dispose();
    namaController.dispose();
    alamatController.dispose();
    telponController.dispose();
    usernameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void register() async {
    if (Get.isSnackbarOpen) return;

    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    try {
      UserModel user = UserModel(
        nik: int.parse(nikController.text),
        nama: namaController.text,
        alamat: alamatController.text,
        telpon: telponController.text,
        username: usernameController.text,
        password: passwordController.text,
        role: "agen",
      );

      ApiResponseModel res = await _authService.registrasiAgen(user);

      Get.back();

      Get.snackbar('Informasi', res.message);
    } on ApiResponseModel catch (res) {
      Get.snackbar('Informasi', res.errorMessage);
    }

    isLoading.value = false;
  }

  String? validasiFormRegister(String input, String? value) {
    if (value == null || value.isEmpty) {
      return "$input tidak boleh kosong";
    }

    if (input == 'NIK' || input == 'Nomor Telepon') {
      if (!value.isNum) return '$input harus angka';
    }

    return null;
  }
}
