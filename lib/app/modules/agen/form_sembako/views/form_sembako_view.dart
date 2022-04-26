import 'dart:io';

import 'package:e_warong/app/themes/app_text.dart';
import 'package:e_warong/app/widgets/custom_submit_button.dart';
import 'package:e_warong/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/form_sembako_controller.dart';

class FormSembakoView extends GetView<FormSembakoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Sembako'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nama",
                  style: primaryTextStyle.copyWith(fontSize: 16),
                ),
              ),
              CustomTextField(
                controller: controller.namaController,
                hintText: "Masukkan Nama",
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Harga",
                  style: primaryTextStyle.copyWith(fontSize: 16),
                ),
              ),
              CustomTextField(
                controller: controller.hargaController,
                hintText: "Masukkan Harga",
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Stok",
                  style: primaryTextStyle.copyWith(fontSize: 16),
                ),
              ),
              CustomTextField(
                controller: controller.stokController,
                hintText: "Masukkan Stok",
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 8),
              Obx(() {
                return GestureDetector(
                  onTap: controller.imagePicker,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                        height: 200,
                        width: 200,
                        color: Colors.grey[300],
                        child: Stack(
                          children: [
                            const SizedBox(height: 200, width: 200),
                            if (controller.imagePath.isNotEmpty)
                              Image.file(
                                File(controller.imagePath.value),
                                fit: BoxFit.cover,
                                height: 200,
                                width: 200,
                              )
                            else if (controller.sembako.fotoUrl != null)
                              Image.network(
                                controller.sembako.fotoUrl!,
                                fit: BoxFit.cover,
                                height: 200,
                                width: 200,
                              )
                            else
                              Container(),
                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    LineIcons.pen,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                  Text(
                                    "Ubah Gambar",
                                    style: boldTextStyle.copyWith(
                                      color: Colors.white,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(1, 1),
                                          blurRadius: 3.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                        Shadow(
                                          offset: Offset(1, 1),
                                          blurRadius: 8.0,
                                          color: Color.fromARGB(125, 0, 0, 255),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                        // : Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Icon(
                        //         Icons.image,
                        //         color: primaryColor,
                        //         size: 50,
                        //       ),
                        //       const Text(
                        //         "Pilih Gambar",
                        //         style: boldTextStyle,
                        //       ),
                        //     ],
                        //   ),
                        ),
                  ),
                );
              }),
              const SizedBox(height: 16),
              Obx(() {
                return CustomSubmitButton(
                  isLoading: controller.isLoading.value,
                  icon: Icon(
                    controller.formType == FormType.add
                        ? LineIcons.plusCircle
                        : LineIcons.edit,
                    color: Colors.white,
                  ),
                  text: controller.formType == FormType.add ? "Tambah" : "Ubah",
                  onSubmit: () => controller.formType == FormType.add
                      ? controller.addSembako()
                      : controller.editSembako(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
