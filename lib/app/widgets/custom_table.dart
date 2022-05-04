import 'package:e_warong/app/data/models/laporan_model.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:flutter/material.dart';

class CustomTable extends StatelessWidget {
  final List<LaporanSembakosModel> sembakos;

  const CustomTable({Key? key, required this.sembakos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Sembako",
                style: boldTextStyle,
              ),
              Text(
                "Jumlah",
                style: boldTextStyle,
              ),
            ],
          ),
          const Divider(
            thickness: 2,
          ),
          // Body
          Flexible(
            child: ListView.builder(
              itemCount: sembakos.length,
              itemBuilder: (context, index) {
                final LaporanSembakosModel sembako = sembakos[index];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          sembako.sembako!.nama!,
                        ),
                        Text(
                          sembako.jumlah.toString(),
                        ),
                      ],
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
