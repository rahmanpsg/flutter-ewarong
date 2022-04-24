import 'package:e_warong/app/data/models/sembako_model.dart';
import 'package:e_warong/app/modules/agen/form_sembako/controllers/form_sembako_controller.dart';
import 'package:e_warong/app/modules/agen/stok_sembako/controllers/stok_sembako_controller.dart';
import 'package:e_warong/app/routes/app_pages.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:e_warong/app/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StokSembakoView extends GetView<StokSembakoController> {
  const StokSembakoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          final SembakoModel sembakoModel = SembakoModel();

          Get.toNamed(
            Routes.FORM_SEMBAKO,
            arguments: FormSembakoArguments(
              sembako: sembakoModel,
            ),
          );
        },
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Obx(() {
              return controller.isLoading.isTrue
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
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
                      : ListView.builder(
                          itemCount: controller.sembakoList.length,
                          itemBuilder: ((context, index) {
                            SembakoModel sembako =
                                controller.sembakoList[index];

                            return ListTile(
                              isThreeLine: true,
                              leading: CustomImage(foto: sembako.foto),
                              title: Text(sembako.nama!),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Harga: ${sembako.hargaFormat}'),
                                  Text('Stok: ${sembako.stok}'),
                                ],
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () => Get.toNamed(
                                Routes.FORM_SEMBAKO,
                                arguments: FormSembakoArguments(
                                  formType: FormType.edit,
                                  sembako: sembako,
                                ),
                              ),
                            );
                          }),
                        );
            }),
          ),
        ],
      ),
    );
  }
}