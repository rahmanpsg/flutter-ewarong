import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:e_warong/app/widgets/custom_chip.dart';
import 'package:e_warong/app/widgets/custom_table.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/laporan_controller.dart';

class LaporanList extends GetView<LaporanController> {
  final int bulan;

  LaporanList({required this.bulan});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.isTrue
          ? Center(child: CircularProgressIndicator())
          : controller.laporanBulan(bulan) == null
              ? Center(
                  child: Text('Tidak ada laporan bulan ini'),
                )
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: secondaryColor,
                        ),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                "Total sembako terjual",
                                style: boldTextStyle.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              trailing: CustomChip(
                                label: controller.laporanBulan(bulan)!.getTotal,
                                color: dangerColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: const Divider(
                                color: Colors.white,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                "Pendapatan",
                                style: boldTextStyle.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              trailing: CustomChip(
                                label: controller
                                    .laporanBulan(bulan)!
                                    .getPendapatan(),
                                color: dangerColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(child: CustomTable()),
                    ],
                  ),
                ),
    );
  }
}
