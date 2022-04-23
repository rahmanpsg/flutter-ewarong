import 'package:e_warong/app/data/models/user_model.dart';
import 'package:e_warong/app/modules/agen/controllers/agen_controller.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PengaturanController extends GetxController {
  RxBool isLoading = true.obs;

  RxBool isEdit = false.obs;

  Rx<UserModel?> agen = Get.find<AgenController>().user.obs;

  @override
  void onInit() {
    isLoading.value = false;
    super.onInit();
  }

  void toggleEdit() {
    if (isEdit.isTrue) {
      Get.defaultDialog(
          title: 'Informasi',
          middleText: 'Anda yakin untuk menyimpan perubahan?',
          textConfirm: "Oke",
          textCancel: "Batal",
          onConfirm: () {
            isLoading.value = true;

            // isEdit.value = false;
            Get.back();
          },
          onCancel: () {
            isEdit.value = false;
          });
    } else {
      isEdit.value = !isEdit.value;
    }
  }

  void showEditDialog(String title, String value) {
    TextEditingController _textEditingController =
        TextEditingController(text: value);

    Get.defaultDialog(
      title: "Ubah $title",
      textConfirm: "Oke",
      textCancel: "Batal",
      buttonColor: secondaryColor,
      onConfirm: () {
        switch (title.toLowerCase()) {
          case 'username':
            agen.value!.username = _textEditingController.text;
            break;
          case 'password':
            agen.value!.password = _textEditingController.text;
            break;
          default:
        }

        agen.refresh();
        Get.back();
      },
      content: CustomTextField(
        controller: _textEditingController,
        hintText: title,
      ),
    );
  }
}
