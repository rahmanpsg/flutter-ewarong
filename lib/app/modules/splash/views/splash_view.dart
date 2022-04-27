import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: Landing(),
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
    );
  }
}

class Landing extends GetView<SplashController> {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback(
      controller.cekLogin,
    );
    return Container(
      color: Colors.transparent,
    );
  }
}
