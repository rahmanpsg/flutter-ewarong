import 'package:e_warong/app/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  // GetStorage().erase();
  runApp(
    GetMaterialApp(
      title: "E-Warong",
      theme: AppTheme.basic,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
