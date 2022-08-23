import 'package:e_warong/app/data/models/api_response_model.dart';
import 'package:e_warong/app/data/models/user_model.dart';
import 'package:e_warong/app/data/services/auth_service.dart';
import 'package:e_warong/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:qr_code_tools/qr_code_tools.dart';

class QrcodeController extends GetxController {
  late final GlobalKey qrKey;
  late final QRViewController qrViewController;

  final ImagePicker _picker = ImagePicker();

  final AuthService _authService = AuthService();

  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    qrKey = GlobalKey(debugLabel: "QR");

    super.onInit();
  }

  void onQRViewCreated(QRViewController controller) {
    qrViewController = controller;

    qrViewController.scannedDataStream.listen((scanData) async {
      if (isLoading.isTrue) return;

      if (Get.isSnackbarOpen || scanData.code == null) return;

      await loginQRCode(scanData.code!);
    });
  }

  void openFromFile() async {
    try {
      final image = await _picker.pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final result = await QrCodeToolsPlugin.decodeFrom(image.path);

      print("result: $result");

      await loginQRCode(result);
    } catch (e) {
      print(e);
    }
  }

  Future<void> loginQRCode(String result) async {
    try {
      isLoading.value = true;

      final user = await _authService.loginQRCode(result);

      print("user: $user");

      Get.snackbar('Informasi',
          "Halo anda berhasil login dengan akun ${user.role} : ${user.nama}");

      await Future.delayed(Duration(milliseconds: 300));

      if (user.role == 'user') {
        Get.offAllNamed(Routes.USER, arguments: user);
      } else if (user.role == 'agen') {
        Get.offAllNamed(Routes.AGEN, arguments: user);
      }
    } on String catch (err) {
      Get.snackbar('Informasi', err);
    } on ApiResponseModel catch (res) {
      Get.snackbar('Informasi', res.errorMessage);
    } catch (e) {
      Get.snackbar('Gagal', "QR Code tidak dikenali");
    }

    isLoading.value = false;
  }
}
