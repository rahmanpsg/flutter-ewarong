import 'package:get/get.dart';

import '../modules/agen/bindings/agen_binding.dart';
import '../modules/agen/detail_pesanan/bindings/detail_pesanan_binding.dart';
import '../modules/agen/detail_pesanan/views/detail_pesanan_view.dart';
import '../modules/agen/form_sembako/bindings/form_sembako_binding.dart';
import '../modules/agen/form_sembako/views/form_sembako_view.dart';
import '../modules/agen/views/agen_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/register/bindings/register_binding.dart';
import '../modules/auth/register/views/register_view.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
      children: [
        GetPage(
          name: _Paths.REGISTER,
          page: () => RegisterView(),
          binding: RegisterBinding(),
          transition: Transition.rightToLeftWithFade,
        ),
      ],
    ),
    GetPage(
      name: _Paths.AGEN,
      page: () => AgenView(),
      binding: AgenBinding(),
      children: [
        GetPage(
          name: _Paths.DETAIL_PESANAN,
          page: () => DetailPesananView(),
          binding: DetailPesananBinding(),
        ),
        GetPage(
          name: _Paths.FORM_SEMBAKO,
          page: () => FormSembakoView(),
          binding: FormSembakoBinding(),
        ),
      ],
    ),
  ];
}
