import 'package:e_warong/app/themes/app_text.dart';
import 'package:e_warong/app/widgets/custom_submit_button.dart';
import 'package:e_warong/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/lupa_password_controller.dart';

class LupaPasswordView extends GetView<LupaPasswordController> {
  const LupaPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lupa Password'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nomor KPM",
                style: primaryTextStyle.copyWith(fontSize: 16),
              ),
              CustomTextField(
                controller: controller.kpmController,
                hintText: "Masukkan nomor KPM anda",
                keyboardType: TextInputType.number,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Nomor KPM tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              Text(
                "Nomor Telepon",
                style: primaryTextStyle.copyWith(fontSize: 16),
              ),
              CustomTextField(
                controller: controller.kpmController,
                hintText: "Masukkan nomor telepon anda",
                keyboardType: TextInputType.phone,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Nomor telepon tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomSubmitButton(
                text: "Kirim",
                onSubmit: controller.kirim,
                isLoading: controller.isLoading.value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
