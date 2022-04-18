import 'package:e_warong/app/modules/agen/laporan/views/laporan_view.dart';
import 'package:e_warong/app/modules/agen/pengaturan/views/pengaturan_view.dart';
import 'package:e_warong/app/modules/agen/pesanan/views/pesanan_view.dart';
import 'package:e_warong/app/modules/agen/stok_sembako/views/stok_sembako_view.dart';
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
            StokSembakoView(),
            PesananView(),
            LaporanView(),
            PengaturanView()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
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
              icon: Icon(Icons.data_thresholding_rounded),
              label: 'Laporan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Pengaturan',
            ),
          ],
          currentIndex: controller.tabIndexSelected.value,
          backgroundColor: Colors.white,
          selectedItemColor: primaryColor,
          unselectedItemColor: secondaryColor,
          onTap: controller.changePage,
        ),
      );
    });
  }
}
