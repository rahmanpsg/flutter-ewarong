import 'package:e_warong/app/data/models/api_response_model.dart';
import 'package:e_warong/app/data/models/sembako_model.dart';
import 'package:e_warong/app/data/models/user_model.dart';
import 'package:e_warong/app/data/services/sembako_service.dart';
import 'package:e_warong/app/modules/masyarakat/controllers/masyarakat_controller.dart';
import 'package:e_warong/app/modules/masyarakat/detail_sembako/controllers/detail_sembako_controller.dart';
import 'package:e_warong/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SembakoController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString errorMessage = ''.obs;

  final SembakoService _sembakoService = SembakoService();
  final TextEditingController searchController = TextEditingController();

  RxBool onSearch = false.obs;
  RxString search = ''.obs;

  UserModel masyarakat = Get.find<MasyarakatController>().user;

  RxList<SembakoModel> _sembakoList = <SembakoModel>[].obs;
  RxList<SembakoModel> _sembakoSearchList = <SembakoModel>[].obs;

  List<SembakoModel> get sembakoList =>
      onSearch.isFalse ? _sembakoList : _sembakoSearchList;

  @override
  void onInit() {
    getAllSembako();

    searchController.addListener(() {
      search.value = searchController.text;
    });

    debounce(search, ((String keyword) {
      onSearch.value = search.isNotEmpty;

      if (keyword.isNotEmpty) {
        searchSembako(keyword);
      }

      isLoading.value = false;
    }));

    super.onInit();
  }

  Future getAllSembako() async {
    isLoading.value = true;
    try {
      _sembakoList.value = await _sembakoService.getAll();
    } on ApiResponseModel catch (res) {
      isError.value = true;
      errorMessage.value = res.message;
    }

    isLoading.value = false;
  }

  Future searchSembako(String keyword) async {
    isLoading.value = true;
    try {
      _sembakoSearchList.value = await _sembakoService.getByKeyword(keyword);
    } on ApiResponseModel catch (res) {
      isError.value = true;
      errorMessage.value = res.message;
    }

    isLoading.value = false;
  }

  void toDetailSembako(SembakoModel sembako) {
    Get.toNamed(Routes.DETAIL_SEMBAKO,
        arguments: DetailSembakoArguments(sembako: sembako));
  }
}
