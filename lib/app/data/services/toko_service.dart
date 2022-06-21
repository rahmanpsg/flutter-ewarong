import 'package:e_warong/app/data/api/api_client.dart';
import 'package:e_warong/app/data/models/toko_model.dart';

class TokoService {
  final ApiClient _apiClient = ApiClient();

  Future<List<TokoModel>> getAll() async {
    final response = await _apiClient.getData('/toko');

    if (!response.error) {
      List<TokoModel> listToko = [];

      for (var toko in response.data) {
        print(TokoModel.fromJson(toko));
        listToko.add(TokoModel.fromJson(toko));
      }

      return listToko;
    }

    throw response;
  }
}
