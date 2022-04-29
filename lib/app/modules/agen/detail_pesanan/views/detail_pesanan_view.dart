import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:e_warong/app/widgets/custom_chip.dart';
import 'package:e_warong/app/widgets/custom_image.dart';
import 'package:e_warong/app/widgets/custom_submit_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_pesanan_controller.dart';

class DetailPesananView extends GetView<DetailPesananController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pesanan'),
        centerTitle: true,
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              children: [
                                CustomImage(
                                  size: 80,
                                  empty: Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller
                                          .pesanan.value.masyarakat!.nama!,
                                      style: boldTextStyle.copyWith(
                                          color: primaryColor),
                                    ),
                                    Text(
                                      "Saldo",
                                      style: primaryTextStyle,
                                    ),
                                    Text(
                                      "Rp. 25.000",
                                      style: boldTextStyle.copyWith(
                                          color: primaryColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Text(
                            controller.pesanan.value.jumlah.toString(),
                            style: boldTextStyle.copyWith(
                              color: primaryColor,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "Waktu Pesanan",
                              style: boldTextStyle,
                            ),
                            trailing: Text(
                              controller.pesanan.value.waktuPesanan(),
                              style: primaryTextStyle,
                            ),
                          ),
                          Divider(),
                          ListTile(
                            title: Text(
                              "Pesanan",
                              style: boldTextStyle,
                            ),
                            trailing: Text(
                              controller.pesanan.value.sembako!.nama!,
                              style: primaryTextStyle,
                            ),
                          ),
                          Divider(),
                          ListTile(
                            title: Text(
                              "Total",
                              style: boldTextStyle,
                            ),
                            trailing: Text(
                              controller.pesanan.value.totalHarga(),
                              style: primaryTextStyle,
                            ),
                          ),
                          if (controller.pesanan.value.status != null)
                            Divider(),
                          if (controller.pesanan.value.status != null)
                            ListTile(
                              title: Text(
                                "Status",
                                style: boldTextStyle,
                              ),
                              trailing: CustomChip(
                                label: controller.pesanan.value.statusPesanan,
                                color: controller.pesanan.value.status == false
                                    ? dangerColor
                                    : secondaryColor,
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              if (controller.pesanan.value.status == null)
                Column(
                  children: [
                    const SizedBox(height: 8),
                    CustomSubmitButton(
                      icon: Icon(
                        Icons.handshake_rounded,
                        color: Colors.white,
                      ),
                      text: "Terima Pesanan",
                      onSubmit: () => controller.confirmPesanan(true),
                    ),
                    const SizedBox(height: 8),
                    CustomSubmitButton(
                      icon: Icon(
                        Icons.back_hand_rounded,
                        color: Colors.white,
                      ),
                      text: "Tolak Pesanan",
                      color: dangerColor,
                      onSubmit: () => controller.confirmPesanan(false),
                    )
                  ],
                ),
            ],
          ),
        );
      }),
    );
  }
}
