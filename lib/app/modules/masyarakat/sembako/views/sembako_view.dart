import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:e_warong/app/widgets/custom_card.dart';
import 'package:e_warong/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/sembako_controller.dart';

class SembakoView extends GetView<SembakoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextField(
          controller: controller.searchController,
          hintText: 'Cari sembako',
          suffixIcon: Icon(
            LineIcons.search,
            color: primaryColor,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                        : controller.sembakoList.isEmpty
                            ? Center(
                                child: Text('Tidak ada data sembako'),
                              )
                            : GridView.builder(
                                itemCount: controller.sembakoList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                ),
                                itemBuilder: (context, index) => CustomCard(
                                  fotoUrl:
                                      controller.sembakoList[index].fotoUrl,
                                  title: controller.sembakoList[index].nama!,
                                  subtitle:
                                      controller.sembakoList[index].hargaFormat,
                                  onTap: () => controller.toDetailSembako(
                                    controller.sembakoList[index],
                                  ),
                                ),
                              );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
