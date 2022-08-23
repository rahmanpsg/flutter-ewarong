import 'package:e_warong/app/data/models/api_response_model.dart';
import 'package:e_warong/app/data/models/user_model.dart';
import 'package:e_warong/app/data/services/auth_service.dart';
import 'package:e_warong/app/data/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;

  final UserService _userService = UserService();

  late final AuthService _authService;

  late final GlobalKey<FormState> formKey;

  late final TextEditingController namaController;
  late final TextEditingController namaTokoController;
  late final TextEditingController alamatController;
  late final TextEditingController telponController;
  // late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void onInit() {
    _authService = AuthService();

    formKey = GlobalKey<FormState>();

    namaTokoController = TextEditingController();
    namaController = TextEditingController();
    alamatController = TextEditingController();
    telponController = TextEditingController();
    // usernameController = TextEditingController();
    passwordController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    namaTokoController.dispose();
    namaController.dispose();
    alamatController.dispose();
    telponController.dispose();
    // usernameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void register() async {
    if (Get.isSnackbarOpen) return;

    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    try {
      UserModel user = UserModel(
        nama: namaController.text,
        namaToko: namaTokoController.text,
        alamat: alamatController.text,
        telpon: telponController.text,
        password: passwordController.text,
        role: "agen",
      );

      print(user.toString());

      ApiResponseModel res = await _authService.registrasiAgen(user);

      print(res.data);

      user.id = res.data['_id'];
      user.kode = res.data['kode'];

      // Get.back();

      // Get.snackbar('Informasi', res.message);

      await Get.defaultDialog(
          title: "Registrasi Berhasil",
          middleText:
              "Silahkan login untuk melanjutkan.\nKode Agen: ${user.kode}",
          actions: [
            TextButton.icon(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: user.kode));

                Get.snackbar('Informasi', 'Kode agen berhasil disalin');
              },
              icon: LineIcon(LineIcons.copy),
              label: Text("Salin Kode"),
            ),
            TextButton.icon(
              onPressed: () async {
                final response = await _userService.saveQRCode(
                    id: user.id!, role: user.role!);

                if (response != true) return;

                Get.snackbar('Informasi', 'QR Code berhasil diunduh');
              },
              icon: LineIcon(LineIcons.qrcode),
              label: Text("Download QR Code"),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Tutup"),
            ),
          ]);

      Get.back();
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
