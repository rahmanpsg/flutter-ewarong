import 'package:e_warong/app/data/models/api_response_model.dart';
import 'package:e_warong/app/data/models/sembako_model.dart';
import 'package:e_warong/app/data/models/user_model.dart';
import 'package:e_warong/app/data/services/sembako_service.dart';
import 'package:e_warong/app/modules/masyarakat/controllers/masyarakat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SembakoController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString errorMessage = ''.obs;

  RxList<SembakoModel> sembakoList = <SembakoModel>[].obs;

  late final SembakoService _sembakoService;
  late final TextEditingController searchController;

  UserModel? masyarakat = Get.find<MasyarakatController>().user;

  @override
  void onInit() {
    _sembakoService = SembakoService();
    searchController = TextEditingController();
    getAllSembako();

    super.onInit();
  }

  void getAllSembako() async {
    isLoading.value = true;
    try {
      sembakoList.value = await _sembakoService.getAll();
    } on ApiResponseModel catch (res) {
      isError.value = true;
      errorMessage.value = res.message;
    }

    isLoading.value = false;
  }
}
