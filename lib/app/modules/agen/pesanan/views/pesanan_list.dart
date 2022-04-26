import 'package:e_warong/app/data/models/pesanan_model.dart';
import 'package:e_warong/app/modules/agen/detail_pesanan/controllers/detail_pesanan_controller.dart';
import 'package:e_warong/app/modules/agen/pesanan/controllers/pesanan_controller.dart';
import 'package:e_warong/app/routes/app_pages.dart';
import 'package:e_warong/app/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

class PesananList extends GetView<PesananController> {
  final List<PesananModel> pesananList;

  const PesananList({
    Key? key,
    required this.pesananList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('id', timeago.IdMessages());

    return controller.isLoading.isTrue
        ? Center(child: CircularProgressIndicator())
        : pesananList.isEmpty
            ? Center(
                child: Text(
                  'Tidak ada data pesanan',
                ),
              )
            : ListView.builder(
                itemCount: pesananList.length,
                itemBuilder: (context, index) {
                  PesananModel pesanan = pesananList[index];

                  return ListTile(
                    isThreeLine: true,
                    leading: CustomImage(foto: pesanan.sembako!.fotoUrl),
                    title: Text(pesanan.sembako!.nama!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total Pesanan: ${pesanan.jumlah}'),
                        Text(timeago.format(pesanan.createdAt!, locale: "id")),
                      ],
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Get.toNamed(
                        Routes.DETAIL_PESANAN,
                        arguments: DetailPesananArguments(pesanan: pesanan),
                      );
                    },
                  );
                },
              );
  }
}
