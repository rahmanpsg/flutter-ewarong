import 'package:dio/dio.dart';
import 'package:e_warong/app/data/api/api_client.dart';

import 'package:e_warong/app/data/models/sembako_model.dart';

class SembakoService {
  final ApiClient _apiClient = ApiClient();

  Future<List<SembakoModel>> getAll() async {
    final response = await _apiClient.getData('/sembako');

    if (!response.error) {
      List<SembakoModel> _listSembako = [];

      for (var sembako in response.data) {
        print(SembakoModel.fromJson(sembako));
        _listSembako.add(SembakoModel.fromJson(sembako));
      }

      return _listSembako;
    }

    throw response;
  }

  Future<List<SembakoModel>> getAllAgen(String idAgen) async {
    final response = await _apiClient.getData('/sembako/agen/$idAgen');

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
    FormData _formData = FormData.fromMap(sembako.toJson());

    if (sembako.file != null) {
      MultipartFile _file = await MultipartFile.fromFile(sembako.file!.path,
          filename: DateTime.now().millisecondsSinceEpoch.toString());

      _formData.files.add(MapEntry('file', _file));
    }

    final response = await _apiClient.postData('/sembako/$idAgen', _formData);

    if (!response.error) {
      return SembakoModel.fromJson(response.data);
    }

    throw response;
  }

  Future<SembakoModel> put(String id, SembakoModel sembako) async {
    FormData _formData = FormData.fromMap(sembako.toJson());

    if (sembako.file != null) {
      MultipartFile _file = await MultipartFile.fromFile(sembako.file!.path,
          filename: DateTime.now().millisecondsSinceEpoch.toString());

      _formData.files.add(MapEntry('file', _file));
    }

    final response = await _apiClient.putData('/sembako/$id', _formData);

    if (!response.error) {
      return SembakoModel.fromJson(response.data);
    }

    throw response;
  }
}
