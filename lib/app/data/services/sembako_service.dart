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
}
