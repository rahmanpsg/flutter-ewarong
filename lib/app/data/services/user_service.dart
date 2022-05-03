import 'package:e_warong/app/data/api/api_client.dart';
import 'package:e_warong/app/data/models/api_response_model.dart';
import 'package:e_warong/app/data/models/user_model.dart';

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
}
