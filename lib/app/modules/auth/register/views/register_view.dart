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
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrasi Agen'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: controller.formKey,
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
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: (String? value) {
                    return controller.validasiFormRegister('NIK', value);
                  },
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
                  validator: (String? value) {
                    return controller.validasiFormRegister('Nama', value);
                  },
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Alamat",
                    style: primaryTextStyle.copyWith(fontSize: 16),
                  ),
                ),
                CustomTextField(
                  controller: controller.alamatController,
                  hintText: "Masukkan Alamat",
                  validator: (String? value) {
                    return controller.validasiFormRegister('Alamat', value);
                  },
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nomor Telepon",
                    style: primaryTextStyle.copyWith(fontSize: 16),
                  ),
                ),
                CustomTextField(
                  controller: controller.telponController,
                  hintText: "Masukkan Nomor Telepon",
                  keyboardType: TextInputType.phone,
                  validator: (String? value) {
                    return controller.validasiFormRegister(
                        'Nomor Telepon', value);
                  },
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Username",
                    style: primaryTextStyle.copyWith(fontSize: 16),
                  ),
                ),
                CustomTextField(
                  controller: controller.usernameController,
                  hintText: "Masukkan Username",
                  validator: (String? value) {
                    return controller.validasiFormRegister('Username', value);
                  },
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password",
                    style: primaryTextStyle.copyWith(fontSize: 16),
                  ),
                ),
                CustomTextField(
                  controller: controller.passwordController,
                  hintText: "Masukkan Password",
                  obscureText: true,
                  validator: (String? value) {
                    return controller.validasiFormRegister('Password', value);
                  },
                ),
                const SizedBox(height: 16),
                CustomSubmitButton(
                  text: "Daftar",
                  onSubmit: controller.register,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
