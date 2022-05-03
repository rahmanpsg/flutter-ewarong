import 'package:e_warong/app/data/enums/user_type.dart';
import 'package:e_warong/app/data/models/api_response_model.dart';
import 'package:e_warong/app/data/models/user_model.dart';
import 'package:e_warong/app/data/services/user_service.dart';
import 'package:e_warong/app/modules/agen/controllers/agen_controller.dart';
import 'package:e_warong/app/modules/masyarakat/controllers/masyarakat_controller.dart';
import 'package:e_warong/app/routes/app_pages.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PengaturanController<T extends GetxController> extends GetxController {
  final UserType userType;

  PengaturanController({required this.userType});

  RxBool isLoading = true.obs;
  RxBool isEdit = false.obs;

  final RxString _username = ''.obs;
  final RxString _password = ''.obs;
  final RxString _foto = ''.obs;

  String get username =>
      _username.value.isEmpty ? 'Klik untuk ubah' : _username.value;
  String get password =>
      _password.value.isEmpty ? 'Klik untuk ubah' : _password.value;

  final UserService _userService = UserService();

  final Rx<UserModel> user = UserModel().obs;

  @override
  void onInit() {
    switch (userType) {
      case UserType.agen:
        user.value = (Get.find<T>() as AgenController).user;
        break;
      case UserType.masyarakat:
        user.value = (Get.find<T>() as MasyarakatController).user;
        break;
    }

    isLoading.value = false;
    super.onInit();
  }

  void updateUser() async {
    isLoading.value = true;

    ApiResponseModel res = await _userService.updateUser(
      id: user.value.id!,
      username: _username.value,
      password: _password.value,
      foto: _foto.value,
    );

    showSnackbar(res.message, res.error);

    try {
      user.value = UserModel.fromJson(res.data);
    } catch (e) {
      print(e);
    }

    isLoading.value = false;
    isEdit.value = false;

    _username.value = '';
    _password.value = '';
    _foto.value = '';
  }

  void toggleEdit() {
    if (isEdit.isTrue) {
      Get.defaultDialog(
          title: 'Informasi',
          middleText: 'Anda yakin untuk menyimpan perubahan?',
          textConfirm: "Oke",
          textCancel: "Batal",
          onConfirm: () {
            updateUser();
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
            _username.value = _textEditingController.text;
            break;
          case 'password':
            _password.value = _textEditingController.text;
            break;
          default:
        }

        user;
        Get.back();
      },
      content: CustomTextField(
        controller: _textEditingController,
        hintText: title,
      ),
    );
  }

  void showSnackbar(String text, [bool error = false]) {
    Get.snackbar(
      'Informasi',
      text,
      snackPosition: SnackPosition.TOP,
      backgroundColor: error ? dangerColor : secondaryColor,
      colorText: Colors.white,
      borderRadius: 10,
      margin: EdgeInsets.all(10),
      snackStyle: SnackStyle.FLOATING,
    );
  }

  void logout() {
    GetStorage().erase();
    Get.offNamed(Routes.AUTH);
  }
}
