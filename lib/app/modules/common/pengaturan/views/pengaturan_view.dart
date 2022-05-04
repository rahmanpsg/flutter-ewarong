import 'package:e_warong/app/data/enums/user_type.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:e_warong/app/widgets/custom_image.dart';
import 'package:e_warong/app/widgets/custom_submit_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../controllers/pengaturan_controller.dart';

class PengaturanView extends GetView<PengaturanController> {
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = boldTextStyle.copyWith(color: primaryColor);

    final TextStyle textEditStyle = boldTextStyle.copyWith(
      decoration: TextDecoration.underline,
      color: dangerColor,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Pengaturan"),
        centerTitle: true,
        actions: [
          Obx(() {
            return IconButton(
              onPressed:
                  controller.isLoading.isTrue ? null : controller.toggleEdit,
              icon: controller.isLoading.isTrue
                  ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Icon(
                      controller.isEdit.isTrue
                          ? LineIcons.save
                          : LineIcons.userEdit,
                    ),
            );
          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Card(
              child: Obx(() {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          "Nama",
                          style: textStyle,
                        ),
                        trailing: Text(
                          controller.user.value.nama!,
                          style: textStyle,
                        ),
                      ),
                      const Divider(),
                      if (controller.userType == UserType.masyarakat) ...[
                        ListTile(
                          title: Text(
                            "Saldo",
                            style: textStyle,
                          ),
                          trailing: Text(
                            controller.user.value.saldoFormat,
                            style: textStyle,
                          ),
                        ),
                        const Divider()
                      ],
                      if (controller.userType == UserType.agen)
                        ListTile(
                          enabled: controller.isEdit.isTrue,
                          onTap: () {
                            controller.showEditDialog(
                                'Username', controller.user.value.username!);
                          },
                          title: Text(
                            "Username",
                            style: textStyle,
                          ),
                          trailing: Text(
                            controller.isEdit.isTrue
                                ? controller.username
                                : controller.user.value.username!,
                            style: controller.isEdit.isTrue
                                ? textEditStyle
                                : textStyle,
                          ),
                        ),
                      if (controller.userType == UserType.masyarakat)
                        ListTile(
                          title: Text(
                            "Nomor KTM",
                            style: textStyle,
                          ),
                          trailing: Text(
                            controller.user.value.ktm.toString(),
                            style: textStyle,
                          ),
                        ),
                      const Divider(),
                      ListTile(
                        enabled: controller.isEdit.isTrue,
                        onTap: () {
                          controller.showEditDialog(
                              'Password', controller.user.value.password!);
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
                          controller.user.value.telpon!,
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
                            controller.user.value.alamat!,
                            style: textStyle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
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
                          controller.user.value.tanggal,
                          style: textStyle,
                        ),
                      ),
                    ],
                  ),
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
