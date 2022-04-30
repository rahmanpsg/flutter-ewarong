import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:e_warong/app/widgets/custom_image.dart';
import 'package:e_warong/app/widgets/custom_submit_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
        title: Text('Profil'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: Container(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    CustomImage(
                      size: 100,
                      empty: Icon(
                        Icons.person,
                        color: Colors.grey,
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
                        controller.masyarakat.nama!,
                        style: textStyle,
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: Text(
                        "KTM",
                        style: textStyle,
                      ),
                      trailing: Text(
                        controller.masyarakat.ktm.toString(),
                        style: textStyle,
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
                        controller.masyarakat.telpon!,
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
                          controller.masyarakat.alamat!,
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
                        controller.masyarakat.tanggal,
                        style: textStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
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
            ),
          ],
        ),
      ),
    );
  }
}
