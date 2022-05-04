import 'package:e_warong/app/data/api/api_client.dart';
import 'package:e_warong/app/data/models/laporan_model.dart';

class LaporanService {
  final ApiClient _apiClient = ApiClient();

  Future<List<LaporanModel>> getAllAgen(String idAgen) async {
    final response = await _apiClient.getData('/laporan/agen/$idAgen');

    if (!response.error) {
      List<LaporanModel> _listSembako = [];

      for (var sembako in response.data) {
        print(LaporanModel.fromJson(sembako));
        _listSembako.add(LaporanModel.fromJson(sembako));
      }

      return _listSembako;
    }

    throw response;
  }
}
