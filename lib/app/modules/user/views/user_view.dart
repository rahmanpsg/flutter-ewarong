import 'package:e_warong/app/modules/common/profil/views/Profil_view.dart';
import 'package:e_warong/app/modules/user/toko/views/toko_view.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../../common/pesanan/views/pesanan_view.dart';
import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndexSelected.value,
          children: [
            TokoView(),
            PesananView(),
            ProfilView(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: secondaryColor,
                color: Colors.black,
                tabs: [
                  GButton(
                    icon: LineIcons.store,
                    text: 'Toko',
                  ),
                  GButton(
                    icon: LineIcons.shoppingBag,
                    text: 'Pesanan',
                  ),
                  GButton(
                    icon: LineIcons.userCog,
                    text: 'Pengaturan',
                  ),
                ],
                selectedIndex: controller.tabIndexSelected.value,
                onTabChange: controller.changePage,
              ),
            ),
          ),
        ),
      );
    });
  }
}
