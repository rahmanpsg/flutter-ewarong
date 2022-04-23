import 'package:e_warong/app/modules/auth/controllers/auth_controller.dart';
import 'package:e_warong/app/modules/auth/views/register_agen.dart';
import 'package:e_warong/app/routes/app_pages.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:e_warong/app/widgets/custom_submit_button.dart';
import 'package:e_warong/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginAgen extends GetView<AuthController> {
  const LoginAgen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Username",
            style: primaryTextStyle.copyWith(fontSize: 16),
          ),
          CustomTextField(
            controller: controller.usernameController,
            hintText: "Masukkan Username",
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
          ),
          const SizedBox(height: 16),
          CustomSubmitButton(
            icon: Icon(
              Icons.login,
              color: Colors.white,
            ),
            text: "Masuk",
            onSubmit: () => controller.login('agen'),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text("Belum punya akun? "),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.REGISTER);
                  // Get.bottomSheet(
                  //   RegisterAgen(),
                  //   isScrollControlled: true,
                  // );
                },
                child: Text(
                  "Daftar",
                  style: boldTextStyle.copyWith(color: primaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
