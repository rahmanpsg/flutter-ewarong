import 'package:e_warong/app/data/models/sembako_model.dart';
import 'package:e_warong/app/modules/agen/controllers/agen_controller.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:e_warong/app/widgets/custom_submit_button.dart';
import 'package:e_warong/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum FormType { add, edit }

class FormSembako extends GetView<AgenController> {
  final SembakoModel sembakoModel;
  final FormType formType;

  const FormSembako({
    Key? key,
    required this.sembakoModel,
    this.formType = FormType.add,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height * .95,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Container(
            height: 4,
            width: 50,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
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
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 200,
              width: 200,
              color: Colors.grey[300],
              child: sembakoModel.foto != null
                  ? Stack(
                      children: [
                        Image.network(
                          sembakoModel.foto!,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit,
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
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          color: primaryColor,
                          size: 50,
                        ),
                        const Text(
                          "Pilih Gambar",
                          style: boldTextStyle,
                        ),
                      ],
                    ),
            ),
          ),
          const SizedBox(height: 16),
          CustomSubmitButton(
            icon: Icon(
              formType == FormType.add
                  ? Icons.library_add
                  : Icons.edit_outlined,
              color: Colors.white,
            ),
            text: formType == FormType.add ? "Tambah" : "Ubah",
            onSubmit: () => formType == FormType.add
                ? controller.addSembako(sembakoModel)
                : controller.editSembako(sembakoModel),
          ),
        ],
      ),
    );
  }
}
