import 'package:e_warong/app/modules/agen/views/stok_sembako.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/agen_controller.dart';

class AgenView extends GetView<AgenController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text("E-Warong"),
          centerTitle: true,
        ),
        body: IndexedStack(
          index: controller.tabIndexSelected.value,
          children: [
            StokSembako(),
            const Text("1"),
            const Text("1"),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: 'Stok Sembako',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Pesanan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Pengaturan',
            ),
          ],
          currentIndex: controller.tabIndexSelected.value,
          backgroundColor: primaryColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: secondaryColor,
          onTap: controller.changePage,
        ),
      );
    });
  }
}
