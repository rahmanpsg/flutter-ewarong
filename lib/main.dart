import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_warong/app/data/models/api_response_model.dart';
import 'package:e_warong/app/data/models/user_model.dart';
import 'package:e_warong/app/data/services/auth_service.dart';
import 'package:e_warong/app/modules/agen/bindings/agen_binding.dart';
import 'package:e_warong/app/modules/agen/views/agen_view.dart';
import 'package:e_warong/app/modules/auth/bindings/auth_binding.dart';
import 'package:e_warong/app/modules/auth/views/auth_view.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:e_warong/app/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "E-Warong",
      theme: AppTheme.basic,
      getPages: AppPages.routes,
      home: AnimatedSplashScreen.withScreenFunction(
        screenFunction: () async {
          try {
            UserModel _user = await AuthService().verifyToken();

            if (_user.role == 'masyarakat') {
              AgenBinding(user: _user).dependencies();
              return AgenView();
            } else if (_user.role == 'agen') {
              AgenBinding(user: _user).dependencies();
              return AgenView();
            }
          } on ApiResponseModel catch (res) {
            print(res.message);
          }

          AuthBinding().dependencies();
          return AuthView();
        },
        duration: 0, //3000,
        splashIconSize: 200,
        splash: Column(
          children: [
            Image.asset('assets/images/logo.png', height: 100),
            const SizedBox(height: 8),
            Text(
              'Aplikasi Transaksi Keluarga Penerima Manfaat (KPM) Program Sembako',
              textAlign: TextAlign.center,
              style: kHeaderTextStyle.copyWith(color: Colors.white),
            ),
          ],
        ),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: secondaryColor,
      ),
    ),
  );
}
