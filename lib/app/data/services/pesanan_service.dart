import 'package:e_warong/app/data/api/api_client.dart';
import 'package:e_warong/app/data/enums/user_type.dart';
import 'package:e_warong/app/data/models/pesanan_model.dart';

class PesananService {
  final ApiClient _apiClient = ApiClient();

  Future<List<PesananModel>> getAll(UserType userType, String idUser) async {
    String role = userType == UserType.agen ? 'agen' : 'user';

    final response = await _apiClient.getData('/pesanan/$role/$idUser');

    if (!response.error) {
      List<PesananModel> _listPesanan = [];

      for (var pesanan in response.data) {
        _listPesanan.add(PesananModel.fromJson(pesanan));
      }

      return _listPesanan;
    }

    throw response;
  }

  Future<PesananModel> post(PesananModel pesanan) async {
    final response = await _apiClient.postData('/pesanan/', pesanan.toJson());

    if (!response.error) {
      return PesananModel.fromJson(response.data);
    }

    throw response;
  }

  Future<PesananModel> konfirmasi(
      UserType userType, String id, PesananModel pesanan) async {
    String role = userType == UserType.agen ? 'agen' : 'user';

    final response = await _apiClient.putData(
        '/pesanan/konfirmasi/$role/$id', pesanan.toJson());

    if (!response.error) {
      return PesananModel.fromJson(response.data);
    }

    throw response;
  }
}
