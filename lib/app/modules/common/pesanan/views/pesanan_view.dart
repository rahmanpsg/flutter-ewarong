import 'package:e_warong/app/themes/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pesanan_controller.dart';
import 'pesanan_list.dart';

class PesananView extends GetView<PesananController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pesanan'),
          centerTitle: true,
        ),
        body: Obx(() => DefaultTabController(
              length: 4,
              child: Column(
                children: <Widget>[
                  TabBar(
                    labelColor: primaryColor,
                    indicatorColor: primaryColor,
                    tabs: <Widget>[
                      Tab(
                        text: controller.pesananStrng +
                            (controller.pesanan.isNotEmpty
                                ? ' (${controller.pesanan.length})'
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
                                ? ' (${controller.pesananSelesai.length})'
                                : ''),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        PesananList(pesananList: controller.pesanan),
                        PesananList(pesananList: controller.pesananDitolak),
                        PesananList(pesananList: controller.pesananDiterima),
                        PesananList(pesananList: controller.pesananSelesai),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
