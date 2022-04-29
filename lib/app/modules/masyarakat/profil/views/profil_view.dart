import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/widgets/custom_submit_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        centerTitle: true,
      ),
      body: Center(
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
    );
  }
}
