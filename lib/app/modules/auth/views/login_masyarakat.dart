import 'package:e_warong/app/modules/auth/controllers/auth_controller.dart';
import 'package:e_warong/app/routes/app_pages.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:e_warong/app/widgets/custom_submit_button.dart';
import 'package:e_warong/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginMasyarakat extends GetView<AuthController> {
  const LoginMasyarakat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Nomor KPM",
              style: primaryTextStyle.copyWith(fontSize: 16),
            ),
            Autocomplete(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return controller.listKpm.where((String option) {
                  return option.contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (String selection) {
                debugPrint('You just selected $selection');
              },
              fieldViewBuilder: (BuildContext context,
                  TextEditingController textEditingController,
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted) {
                controller.kpmController = textEditingController;
                return CustomTextField(
                  controller: textEditingController,
                  focusNode: focusNode,
                  hintText: "Masukkan Nomor KPM",
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Nomor KPM tidak boleh kosong";
                    }

                    if (val.length != 16) {
                      return "Nomor KPM harus 16 digit";
                    }
                    return null;
                  },
                );
              },
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
                onSubmit: () => controller.login('user'),
                isLoading: controller.isLoading.value,
              );
            }),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.LUPA_PASSWORD);
              },
              child: Text(
                'Lupa password?',
                style: boldTextStyle.copyWith(color: primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
