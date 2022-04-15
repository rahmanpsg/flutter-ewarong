import 'package:e_warong/app/modules/auth/views/login_agen.dart';
import 'package:e_warong/app/modules/auth/views/login_user.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text(
              'Aplikasi Transaksi Keluarga Penerima Manfaat (KMP) Program Sembako Kota Parepare',
              style: kHeaderTextStyle.copyWith(color: primaryColor),
              textAlign: TextAlign.center,
            ),
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
                          text: 'Masyarakat KPM',
                        ),
                        Tab(
                          text: 'Agen Toko',
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          LoginUser(),
                          LoginAgen(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
