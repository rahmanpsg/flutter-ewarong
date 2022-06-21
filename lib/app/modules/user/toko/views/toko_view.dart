import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/toko_controller.dart';

class TokoView extends GetView<TokoController> {
  const TokoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Toko'),
        centerTitle: true,
      ),
      body: Obx(() {
        return controller.isLoading.isTrue
            ? Center(child: CircularProgressIndicator())
            : controller.isError.isTrue
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error,
                          color: dangerColor,
                          size: 40,
                        ),
                        Text(
                          controller.errorMessage.value,
                          style: boldTextStyle.copyWith(
                            color: dangerColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                : controller.tokoList.isEmpty
                    ? Center(
                        child: Text('Tidak ada data sembako'),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemBuilder: (_, index) {
                          return ListTile(
                            onTap: () => controller
                                .toSembako(controller.tokoList[index]),
                            tileColor: secondaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              side: BorderSide(color: primaryColor),
                            ),
                            textColor: Colors.white,
                            title: Text(
                              controller.tokoList[index].namaToko ?? '',
                              style: boldTextStyle,
                            ),
                            subtitle: Text(
                              controller.tokoList[index].alamat!,
                            ),
                            trailing: LineIcon(
                              LineIcons.angleRight,
                              color: Colors.white,
                            ),
                          );
                        },
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemCount: controller.tokoList.length);
      }),
    );
  }
}
