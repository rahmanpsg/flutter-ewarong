import 'package:e_warong/app/data/enums/user_type.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:e_warong/app/widgets/custom_submit_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = boldTextStyle.copyWith(color: primaryColor);

    final TextStyle textEditStyle = boldTextStyle.copyWith(
      decoration: TextDecoration.underline,
      color: dangerColor,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
        centerTitle: true,
        // actions: [
        //   Obx(() {
        //     return IconButton(
        //       onPressed:
        //           controller.isLoading.isTrue ? null : controller.toggleEdit,
        //       icon: controller.isLoading.isTrue
        //           ? CircularProgressIndicator(
        //               color: Colors.white,
        //             )
        //           : Icon(
        //               controller.isEdit.isTrue
        //                   ? LineIcons.save
        //                   : LineIcons.userEdit,
        //             ),
        //     );
        //   })
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                        if (controller.userType == UserType.agen) ...[
                          ListTile(
                            title: Text(
                              "Nama Toko",
                              style: textStyle,
                            ),
                            trailing: Text(
                              controller.user.value.namaToko!,
                              style: textStyle,
                            ),
                          ),
                          const Divider(),
                        ],
                        if (controller.userType == UserType.user) ...[
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
                                  'Kode', controller.user.value.kode!);
                            },
                            title: Text(
                              "Kode",
                              style: textStyle,
                            ),
                            trailing: Text(
                              controller.user.value.kode ?? '-',
                              style: textStyle,
                            ),
                          ),
                        if (controller.userType == UserType.user)
                          ListTile(
                            title: Text(
                              "Nomor KPM",
                              style: textStyle,
                            ),
                            trailing: Text(
                              controller.user.value.kpm.toString(),
                              style: textStyle,
                            ),
                          ),
                        // const Divider(),
                        // ListTile(
                        //   enabled: controller.isEdit.isTrue,
                        //   onTap: () {
                        //     controller.showEditDialog(
                        //         'Password', controller.user.value.password!);
                        //   },
                        //   title: Text(
                        //     "Password",
                        //     style: textStyle,
                        //   ),
                        //   trailing: Text(
                        //     controller.isEdit.isTrue
                        //         ? controller.password
                        //         : '********',
                        //     style: controller.isEdit.isTrue
                        //         ? textEditStyle
                        //         : textStyle,
                        //   ),
                        // ),
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
                        const Divider(),
                        ListTile(
                          title: Text(
                            "Download QR Code",
                            style: textStyle,
                          ),
                          trailing: controller.isLoading.isTrue
                              ? SizedBox(
                                  height: 25,
                                  width: 25,
                                  child:
                                      CircularProgressIndicator(strokeWidth: 2),
                                )
                              : IconButton(
                                  onPressed: controller.downloadQRCode,
                                  icon: LineIcon(
                                    LineIcons.alternateCloudDownload,
                                    color: primaryColor,
                                  ),
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
      ),
    );
  }
}
