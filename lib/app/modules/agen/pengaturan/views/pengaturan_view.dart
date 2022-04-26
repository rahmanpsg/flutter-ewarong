import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:e_warong/app/widgets/custom_image.dart';
import 'package:e_warong/app/widgets/custom_submit_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pengaturan_controller.dart';

class PengaturanView extends GetView<PengaturanController> {
  final TextStyle textStyle = boldTextStyle.copyWith(color: primaryColor);

  final TextStyle textEditStyle = boldTextStyle.copyWith(
    decoration: TextDecoration.underline,
    color: dangerColor,
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Card(
              child: Obx(() {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      child: Column(
                        children: <Widget>[
                          CustomImage(
                            size: 100,
                            empty: Icon(
                              controller.isEdit.isTrue
                                  ? Icons.edit
                                  : Icons.person,
                              color: controller.isEdit.isTrue
                                  ? primaryColor
                                  : Colors.grey,
                              size: 40,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ListTile(
                            title: Text(
                              "Nama",
                              style: textStyle,
                            ),
                            trailing: Text(
                              controller.agen.value!.nama,
                              style: textStyle,
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            enabled: controller.isEdit.isTrue,
                            onTap: () {
                              controller.showEditDialog(
                                  'Username', controller.agen.value!.username!);
                            },
                            title: Text(
                              "Username",
                              style: textStyle,
                            ),
                            trailing: Text(
                              controller.isEdit.isTrue
                                  ? controller.username
                                  : controller.agen.value!.username!,
                              style: controller.isEdit.isTrue
                                  ? textEditStyle
                                  : textStyle,
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            enabled: controller.isEdit.isTrue,
                            onTap: () {
                              controller.showEditDialog(
                                  'Password', controller.agen.value!.password);
                            },
                            title: Text(
                              "Password",
                              style: textStyle,
                            ),
                            trailing: Text(
                              controller.isEdit.isTrue
                                  ? controller.password
                                  : '********',
                              style: controller.isEdit.isTrue
                                  ? textEditStyle
                                  : textStyle,
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            title: Text(
                              "Nomor Telepon",
                              style: textStyle,
                            ),
                            trailing: Text(
                              controller.agen.value!.telpon,
                              style: textStyle,
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            title: Text(
                              "Alamat",
                              style: textStyle,
                            ),
                            trailing: SizedBox(
                              width: 200,
                              child: Text(
                                controller.agen.value!.alamat,
                                style: textStyle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            title: Text(
                              "Tanggal Bergabung",
                              style: textStyle,
                            ),
                            trailing: Text(
                              controller.agen.value!.tanggal,
                              style: textStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        onPressed: controller.isLoading.isTrue
                            ? null
                            : controller.toggleEdit,
                        icon: controller.isLoading.isTrue
                            ? CircularProgressIndicator()
                            : Icon(
                                controller.isEdit.isTrue
                                    ? Icons.save_as
                                    : Icons.edit,
                                color: primaryColor,
                              ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            const SizedBox(height: 16),
            Center(
              child: SizedBox(
                width: 150,
                child: CustomSubmitButton(
                  color: dangerColor,
                  icon: Icon(
                    Icons.logout_rounded,
                    color: Colors.white,
                  ),
                  text: 'Keluar',
                  onSubmit: controller.logout,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
