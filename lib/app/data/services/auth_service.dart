import 'package:e_warong/app/data/api/api_client.dart';
import 'package:e_warong/app/data/models/api_response_model.dart';
import 'package:e_warong/app/data/models/user_model.dart';
import 'package:get_storage/get_storage.dart';

class AuthService {
  Future<UserModel> verifyToken() async {
    String? token = GetStorage().read('token');

    if (token == null) {
      throw ApiResponseModel(error: false, message: 'Token tidak ditemukan');
    }

    final response = await ApiClient().getData('/auth/verify', headers: {
      'x-access-token': token,
    });

    if (!response.error) {
      return UserModel.fromJson(response.data);
    }

    throw response;
  }

  Future<UserModel> login(String ktm, String password) async {
    final response = await ApiClient().postData('/auth/login', {
      'ktm': ktm,
      'password': password,
    });

    if (!response.error) {
      UserModel _user = UserModel.fromJson(response.data);
      GetStorage().write('token', _user.token);

      return _user;
    }

    throw response;
  }

  Future loginAgen(String username, String password) async {
    final response = await ApiClient().postData('/auth/login', {
      'username': username,
      'password': password,
    });

    if (!response.error) {
      UserModel _user = UserModel.fromJson(response.data);
      GetStorage().write('token', _user.token);

      return _user;
    }

    throw response;
  }
}
