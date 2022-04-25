import 'package:e_warong/app/modules/auth/register/controllers/register_controller.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:e_warong/app/widgets/custom_submit_button.dart';
import 'package:e_warong/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Registrasi Agen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "NIK",
                style: primaryTextStyle.copyWith(fontSize: 16),
              ),
            ),
            CustomTextField(
              controller: controller.nikController,
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
              controller: controller.namaController,
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
              controller: controller.namaTokoController,
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
              controller: controller.alamatController,
              hintText: "Masukkan Alamat Toko",
            ),
            const SizedBox(height: 16),
            CustomSubmitButton(
              text: "Daftar",
              onSubmit: controller.register,
            ),
          ],
        ),
      ),
    );
  }
}
