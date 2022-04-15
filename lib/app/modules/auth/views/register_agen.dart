import 'package:e_warong/app/modules/auth/controllers/auth_controller.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:e_warong/app/widgets/custom_submit_button.dart';
import 'package:e_warong/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterAgen extends GetView<AuthController> {
  const RegisterAgen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        height: height * .95,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 4,
              width: 50,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "NIK",
                style: primaryTextStyle.copyWith(fontSize: 16),
              ),
            ),
            CustomTextField(
              controller: controller.usernameController,
              hintText: "Masukkan NIK",
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Nama",
                style: primaryTextStyle.copyWith(fontSize: 16),
              ),
            ),
            CustomTextField(
              controller: controller.usernameController,
              hintText: "Masukkan Nama",
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Nama Toko",
                style: primaryTextStyle.copyWith(fontSize: 16),
              ),
            ),
            CustomTextField(
              controller: controller.usernameController,
              hintText: "Masukkan Nama Toko",
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Alamat Toko",
                style: primaryTextStyle.copyWith(fontSize: 16),
              ),
            ),
            CustomTextField(
              controller: controller.usernameController,
              hintText: "Masukkan Alamat Toko",
            ),
            const SizedBox(height: 16),
            CustomSubmitButton(
              icon: Icon(
                Icons.app_registration,
                color: Colors.white,
              ),
              text: "Daftar",
              onSubmit: controller.register,
            ),
          ],
        ),
      ),
    );
  }
}
