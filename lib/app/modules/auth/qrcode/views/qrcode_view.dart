import 'dart:ui';

import 'package:e_warong/app/themes/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../controllers/qrcode_controller.dart';

class QrcodeView extends GetView<QrcodeController> {
  const QrcodeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login QR Code'),
        centerTitle: true,
      ),
      body: Obx(() {
        return Stack(
          children: [
            QRView(
              key: controller.qrKey,
              onQRViewCreated: controller.onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: primaryColor,
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: controller.openFromFile,
                icon: LineIcon(LineIcons.image),
                label: Text("Buka file"),
              ),
            ),
            if (controller.isLoading.isTrue)
              Center(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5.0,
                    sigmaY: 5.0,
                  ),
                  child: CircularProgressIndicator(),
                ),
              )
          ],
        );
      }),
    );
  }
}
