import 'package:e_warong/app/modules/auth/controllers/auth_controller.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:e_warong/app/widgets/custom_image.dart';
import 'package:e_warong/app/widgets/custom_submit_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pengaturan_controller.dart';

class PengaturanView extends GetView<PengaturanController> {
  final AuthController _authController = Get.put(AuthController());
  final TextStyle textStyle = boldTextStyle.copyWith(color: primaryColor);

  final TextStyle textEditStyle = boldTextStyle.copyWith(
    decoration: TextDecoration.underline,
    color: dangerColor,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      horizontal: 8,
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
                        ListTile(
                          title: Text(
                            "Nama",
                            style: textStyle,
                          ),
                          trailing: Text(
                            controller.isEdit.isTrue
                                ? 'Klik untuk ubah'
                                : 'Abd Rahman',
                            style: controller.isEdit.isTrue
                                ? textEditStyle
                                : textStyle,
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          title: Text(
                            "Username",
                            style: textStyle,
                          ),
                          trailing: Text(
                            controller.isEdit.isTrue
                                ? 'Klik untuk ubah'
                                : 'Abd Rahman',
                            style: controller.isEdit.isTrue
                                ? textEditStyle
                                : textStyle,
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          title: Text(
                            "Password",
                            style: textStyle,
                          ),
                          trailing: Text(
                            controller.isEdit.isTrue
                                ? 'Klik untuk ubah'
                                : '********',
                            style: controller.isEdit.isTrue
                                ? textEditStyle
                                : textStyle,
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          title: Text(
                            "Alamat",
                            style: textStyle,
                          ),
                          trailing: Text(
                            'Jl. Poros Polman Pinrang',
                            style: textStyle,
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          title: Text(
                            "Tanggal Bergabung",
                            style: textStyle,
                          ),
                          trailing: Text(
                            DateTime.now().toLocal().toString(),
                            style: textStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      onPressed: controller.toggleEdit,
                      icon: Icon(
                        controller.isEdit.isTrue ? Icons.save_as : Icons.edit,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
          const Spacer(),
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
                onSubmit: _authController.logout,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
