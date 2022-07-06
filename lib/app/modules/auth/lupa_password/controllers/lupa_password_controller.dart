import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LupaPasswordController extends GetxController {
  final RxBool isLoading = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final kpmController = TextEditingController();
  final telpController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void kirim() async {}
}
