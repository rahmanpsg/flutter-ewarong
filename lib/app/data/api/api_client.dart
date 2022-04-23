import 'dart:convert';

import 'package:e_warong/app/data/models/api_response_model.dart';
import 'package:http/http.dart' show Client;

class ApiClient {
  final Client _client = Client();

  final _baseUrl = 'http://10.0.2.2:3000/api';

  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
  };

  Future<ApiResponseModel> getData(String endpoint,
      {Map<String, dynamic>? headers}) async {
    try {
      final response = await _client.get(
        Uri.parse(_baseUrl + endpoint),
        headers: {...headers ?? _headers},
      );

      return ApiResponseModel.fromJson(json.decode(response.body));
    } catch (e) {
      return ApiResponseModel(
        error: true,
        message: e.toString(),
      );
    } finally {
      _client.close();
    }
  }

  Future<ApiResponseModel> postData(String endpoint, dynamic body,
      {Map<String, dynamic>? headers}) async {
    try {
      final response = await _client.post(
        Uri.parse(_baseUrl + endpoint),
        headers: _headers,
        body: jsonEncode(body),
      );

      return ApiResponseModel.fromJson(json.decode(response.body));
    } catch (e) {
      return ApiResponseModel(
        error: true,
        message: e.toString(),
      );
    } finally {
      _client.close();
    }
  }
}
