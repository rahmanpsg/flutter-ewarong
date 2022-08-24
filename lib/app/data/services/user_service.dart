import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:e_warong/app/data/api/api_client.dart';
import 'package:e_warong/app/data/models/api_response_model.dart';
import 'package:e_warong/app/data/models/user_model.dart';
import 'package:e_warong/app/data/utils/code_painter.dart';
import 'package:e_warong/app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UserService {
  final ApiClient _apiClient = ApiClient();

  Future<UserModel> getUser(String id) async {
    final response = await _apiClient.getData('/user/$id');

    if (!response.error) {
      return UserModel.fromJson(response.data);
    }

    throw response;
  }

  Future<ApiResponseModel> updateUser({
    required String id,
    String? username,
    String? password,
    String? foto,
  }) async {
    Map<String, dynamic> _body = {};

    if (username != null && username.isNotEmpty) {
      _body['username'] = username;
    }
    if (password != null && password.isNotEmpty) {
      _body['password'] = password;
    }
    if (foto != null && foto.isNotEmpty) {
      _body['foto'] = foto;
    }

    return await _apiClient.putData('/user/$id', _body);
  }

  Future<ApiResponseModel> getAllKPM() async {
    final response = await _apiClient.getData('/user/kpm');

    if (!response.error) return response;

    throw response;
  }

  Future<bool> saveQRCode({required String id, required String role}) async {
    try {
      String data = jsonEncode({
        'id': id,
        'role': role,
      });

      final image = await QrPainter(
        data: data,
        version: QrVersions.auto,
        color: primaryColor,
        gapless: true,
        emptyColor: Colors.white,
        errorCorrectionLevel: QrErrorCorrectLevel.H,
      ).toImage(2048);

      final picData =
          await CodePainter(qrImage: image, margin: 80).toImageData(2048);

      Uint8List result = picData!.buffer
          .asUint8List(picData.offsetInBytes, picData.lengthInBytes);

      // write file byte
      final directory = await getTemporaryDirectory();

      final path = directory.path;

      DateTime now = DateTime.now();

      File qrFile = File('$path/qrcode_${now.millisecondsSinceEpoch}.png');

      await qrFile.writeAsBytes(result);

      await GallerySaver.saveImage(qrFile.path);

      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }
}
