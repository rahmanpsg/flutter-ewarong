import 'package:e_warong/app/modules/auth/controllers/auth_controller.dart';
import 'package:e_warong/app/routes/app_pages.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:e_warong/app/widgets/custom_submit_button.dart';
import 'package:e_warong/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class LoginAgen extends GetView<AuthController> {
  const LoginAgen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: controller.formAgenKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Kode",
              style: primaryTextStyle.copyWith(fontSize: 16),
            ),
            CustomTextField(
              controller: controller.kodeController,
              hintText: "Masukkan Kode",
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Kode tidak boleh kosong";
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            Text(
              "Password",
              style: primaryTextStyle.copyWith(fontSize: 16),
            ),
            CustomTextField(
              controller: controller.passAgenController,
              hintText: "Masukkan Password",
              obscureText: true,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Password tidak boleh kosong";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Obx(() {
              return CustomSubmitButton(
                text: "Masuk",
                onSubmit: () => controller.login('agen'),
                isLoading: controller.isLoading.value,
              );
            }),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text("Belum punya akun? "),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.REGISTER);
                  },
                  child: Text(
                    "Daftar",
                    style: boldTextStyle.copyWith(color: primaryColor),
                  ),
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: () {
                    Get.toNamed(Routes.QRCODE);
                  },
                  icon: LineIcon(LineIcons.qrcode),
                  label: Text(
                    'Masuk dengan QR code',
                    style: boldTextStyle.copyWith(color: primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
