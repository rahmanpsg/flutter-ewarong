import 'package:dio/dio.dart';
import 'package:e_warong/app/data/api/api_client.dart';

import 'package:e_warong/app/data/models/sembako_model.dart';

class SembakoService {
  final ApiClient _apiClient = ApiClient();

  Future<List<SembakoModel>> getAll(String idAgen) async {
    final response = await _apiClient.getData('/sembako/$idAgen');

    if (!response.error) {
      List<SembakoModel> _listSembako = [];

      for (var sembako in response.data) {
        _listSembako.add(SembakoModel.fromJson(sembako));
      }

      return _listSembako;
    }

    throw response;
  }

  Future<SembakoModel> post(String idAgen, SembakoModel sembako) async {
    final response =
        await _apiClient.postData('/sembako/$idAgen', sembako.toJson());

    if (!response.error) {
      return SembakoModel.fromJson(response.data);
    }

    throw response;
  }

  Future<SembakoModel> put(String id, SembakoModel sembako) async {
    final response = await _apiClient.putData('/sembako/$id', sembako.toJson());

    if (!response.error) {
      return SembakoModel.fromJson(response.data);
    }

    throw response;
  }
}
