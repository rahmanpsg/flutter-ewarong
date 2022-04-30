import 'package:e_warong/app/data/enums/user_type.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:e_warong/app/widgets/custom_chip.dart';
import 'package:e_warong/app/widgets/custom_image.dart';
import 'package:e_warong/app/widgets/custom_submit_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

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
                                  foto: controller.fotoUrl,
                                  size: 80,
                                  empty: Icon(
                                    LineIcons.userCircle,
                                    color: Colors.grey,
                                    size: 40,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                SizedBox(
                                  width: Get.width * .5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.title,
                                        style: boldTextStyle.copyWith(
                                            color: primaryColor),
                                      ),
                                      Text(
                                        controller.subtile.toString(),
                                        style: primaryTextStyle,
                                      ),
                                      if (controller.userType == UserType.agen)
                                        Text(
                                          controller.pesanan.value.masyarakat!
                                              .saldoFormat,
                                          style: boldTextStyle.copyWith(
                                              color: primaryColor),
                                        ),
                                    ],
                                  ),
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
                              controller.pesanan.value.waktuPesanan,
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
                              controller.pesanan.value.totalHarga,
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
                              trailing: SizedBox(
                                width: Get.width * 0.5,
                                child: CustomChip(
                                  label: controller.pesanan.value.statusPesanan,
                                  color:
                                      controller.pesanan.value.status == false
                                          ? dangerColor
                                          : secondaryColor,
                                ),
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              if (controller.pesanan.value.selesai != true &&
                  ((controller.userType == UserType.agen &&
                          controller.pesanan.value.status == null) ||
                      (controller.userType == UserType.masyarakat &&
                          controller.pesanan.value.status == true))) ...[
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
                if (controller.userType == UserType.agen)
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
              if (controller.isLoading.isTrue)
                Expanded(
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
            ],
          ),
        );
      }),
    );
  }
}
