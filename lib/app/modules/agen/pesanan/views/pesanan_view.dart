import 'package:e_warong/app/modules/agen/pesanan/views/pesanan_list.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pesanan_controller.dart';

class PesananView extends GetView<PesananController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Obx(() {
            return DefaultTabController(
              length: 4,
              child: Column(
                children: <Widget>[
                  TabBar(
                    labelColor: primaryColor,
                    indicatorColor: primaryColor,
                    tabs: <Widget>[
                      Tab(
                        text: 'Masuk' +
                            (controller.pesananMasuk.isNotEmpty
                                ? ' (${controller.pesananMasuk.length})'
                                : ''),
                      ),
                      Tab(
                        text: 'Ditolak' +
                            (controller.pesananDitolak.isNotEmpty
                                ? ' (${controller.pesananDitolak.length})'
                                : ''),
                      ),
                      Tab(
                        text: 'Diterima' +
                            (controller.pesananDiterima.isNotEmpty
                                ? ' (${controller.pesananDiterima.length})'
                                : ''),
                      ),
                      Tab(
                        text: 'Selesai' +
                            (controller.pesananSelesai.isNotEmpty
                                ? '(${controller.pesananSelesai.length})'
                                : ''),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        PesananList(pesananList: controller.pesananMasuk),
                        PesananList(pesananList: controller.pesananDitolak),
                        PesananList(pesananList: controller.pesananDiterima),
                        PesananList(pesananList: controller.pesananSelesai),
                      ],
                    ),
                  ),
                  TextButton(
                      onPressed: controller.addDumpPesanan,
                      child: const Text("Tambah"))
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
