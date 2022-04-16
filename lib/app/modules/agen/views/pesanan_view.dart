import 'package:e_warong/app/modules/agen/views/pesanan_masuk.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:flutter/material.dart';

class PesananView extends StatelessWidget {
  const PesananView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                TabBar(
                  labelColor: primaryColor,
                  indicatorColor: primaryColor,
                  tabs: <Widget>[
                    Tab(
                      text: 'Pesanan Masuk',
                    ),
                    Tab(
                      text: 'Selesai',
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      PesananMasuk(),
                      const Text('1'),
                      // LoginUser(),
                      // LoginAgen(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
