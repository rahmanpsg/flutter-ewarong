import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:e_warong/app/widgets/custom_image.dart';
import 'package:e_warong/app/widgets/custom_submit_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/detail_sembako_controller.dart';

class DetailSembakoView extends GetView<DetailSembakoController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Sembako'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomImage(
              foto: controller.sembako.fotoUrl,
              size: width,
              empty: Icon(
                LineIcons.image,
                size: 100,
              ),
              borderRadius: 0,
            ),
            //
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.sembako.hargaFormat,
                    style: kHeaderTextStyle,
                  ),
                  Text(
                    controller.sembako.nama!,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    'Stok : ${controller.sembako.stok}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Obx(() {
              return Container(
                width: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child: controller.isLoading.isTrue
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.agen.namaToko!,
                            style: kHeaderTextStyle,
                          ),
                          Text(
                            controller.agen.alamat!,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 8,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: width * .15,
                  child: CustomSubmitButton(
                    icon: Icon(
                      LineIcons.minus,
                      color: Colors.white,
                    ),
                    onSubmit: controller.substractJumlah,
                  ),
                ),
                const Spacer(),
                Obx(() {
                  return SizedBox(
                    width: width * .1,
                    child: Text(
                      controller.jumlah.value.toString(),
                      style: boldTextStyle.copyWith(
                        color: primaryColor,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                }),
                const Spacer(),
                SizedBox(
                  width: width * .15,
                  child: CustomSubmitButton(
                    icon: Icon(
                      LineIcons.plus,
                      color: Colors.white,
                    ),
                    onSubmit: controller.addJumlah,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: width * .45,
                  child: CustomSubmitButton(
                    text: 'Pesan',
                    onSubmit: controller.pesan,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
