import 'package:e_warong/app/modules/auth/controllers/auth_controller.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:e_warong/app/widgets/custom_submit_button.dart';
import 'package:e_warong/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginUser extends GetView<AuthController> {
  const LoginUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Nomor KPM",
            style: primaryTextStyle.copyWith(fontSize: 16),
          ),
          CustomTextField(
            controller: controller.kpmController,
            hintText: "Masukkan Nomor KPM",
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          Text(
            "Password",
            style: primaryTextStyle.copyWith(fontSize: 16),
          ),
          CustomTextField(
            controller: controller.passMasyarakatController,
            hintText: "Masukkan Password",
            obscureText: true,
          ),
          const SizedBox(height: 16),
          CustomSubmitButton(
            text: "Masuk",
            onSubmit: () => controller.login('masyarakat'),
          )
        ],
      ),
    );
  }
}
