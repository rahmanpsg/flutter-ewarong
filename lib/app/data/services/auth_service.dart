import 'dart:convert';

import 'package:e_warong/app/data/api/api_client.dart';
import 'package:e_warong/app/data/models/api_response_model.dart';
import 'package:e_warong/app/data/models/user_model.dart';
import 'package:get_storage/get_storage.dart';

class AuthService {
  final ApiClient _apiClient = ApiClient();

  Future<UserModel> verifyToken() async {
    String? token = GetStorage().read('token');

    if (token == null) {
      throw ApiResponseModel(error: false, message: 'Token tidak ditemukan');
    }

    final response = await _apiClient.getData('/auth/verify', headers: {
      'x-access-token': token,
    });

    if (!response.error) {
      return UserModel.fromJson(response.data);
    }

    throw response;
  }

  Future<UserModel> login(String kpm, String password) async {
    final response = await _apiClient.postData('/auth/login', {
      'kpm': kpm,
      'password': password,
    });

    if (!response.error) {
      UserModel user = UserModel.fromJson(response.data);
      GetStorage().write('token', user.token);

      return user;
    }

    throw response;
  }

  Future<UserModel> loginAgen(String kode, String password) async {
    final response = await _apiClient.postData('/auth/login', {
      'kode': kode,
      'password': password,
    });

    if (!response.error) {
      UserModel user = UserModel.fromJson(response.data);
      GetStorage().write('token', user.token);

      return user;
    }

    throw response;
  }

  Future<UserModel> loginQRCode(String json) async {
    final response =
        await _apiClient.postData('/auth/login/qrcode', jsonDecode(json));

    if (!response.error) {
      UserModel user = UserModel.fromJson(response.data);
      GetStorage().write('token', user.token);

      return user;
    }

    throw response;
  }

  Future<ApiResponseModel> registrasiAgen(UserModel user) async {
    final response =
        await _apiClient.postData('/auth/registrasi', user.toJson());

    if (!response.error) return response;

    throw response;
  }

  Future<ApiResponseModel> lupaPassword(String kpm, String telpon) async {
    final response = await _apiClient.postData('/auth/lupaPassword', {
      'kpm': kpm,
      'telpon': telpon,
    });

    if (!response.error) return response;

    throw response;
  }
}
