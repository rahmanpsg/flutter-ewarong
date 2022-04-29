import 'package:e_warong/app/modules/agen/laporan/views/laporan_list.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/laporan_controller.dart';

class LaporanView extends GetView<LaporanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laporan"),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: controller.bulanList.length,
        initialIndex: controller.tabIndex,
        child: Column(
          children: <Widget>[
            TabBar(
              isScrollable: true,
              labelColor: primaryColor,
              indicatorColor: primaryColor,
              tabs: controller.bulanList
                  .map((bulan) => Tab(
                        text: bulan,
                      ))
                  .toList(),
            ),
            Expanded(
              child: TabBarView(
                children: controller.bulanList
                    .map(
                      (bulan) => LaporanList(
                        bulan: controller.bulanList.indexOf(bulan),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
