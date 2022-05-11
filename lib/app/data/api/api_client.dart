import 'package:dio/dio.dart';
import 'package:e_warong/app/data/models/api_response_model.dart';
// import 'package:get/get.dart';

class ApiClient {
  Dio dio = Dio(BaseOptions(
    // baseUrl: GetPlatform.isAndroid
    //   ? 'http://10.0.2.2:3000/api'
    //   : 'http://localhost:3000/api',
    baseUrl: 'https://ewarong-server.herokuapp.com/api',
    // connectTimeout: 10000, //10 seconds
    receiveTimeout: 10000,
  ));

  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
  };

  Future<ApiResponseModel> getData(String endpoint,
      {Map<String, dynamic>? headers}) async {
    try {
      final response = await dio.get(endpoint,
          options: Options(headers: headers ?? _headers));

      return ApiResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        return ApiResponseModel.fromJson(e.response?.data);
      }

      return ApiResponseModel(
        error: true,
        message: 'Terjadi masalah yang tidak diketahui',
      );
    }
  }

  Future<ApiResponseModel> postData(String endpoint, dynamic body,
      {Map<String, dynamic>? headers}) async {
    try {
      final response = await dio.post(
        endpoint,
        data: body,
        options: Options(
          headers: {...headers ?? _headers},
        ),
      );

      return ApiResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        return ApiResponseModel.fromJson(e.response?.data);
      }

      return ApiResponseModel(
        error: true,
        message: 'Terjadi masalah yang tidak diketahui',
      );
    }
  }

  Future<ApiResponseModel> putData(String endpoint, dynamic body,
      {Map<String, dynamic>? headers}) async {
    try {
      final response = await dio.put(
        endpoint,
        data: body,
        options: Options(
          headers: {...headers ?? _headers},
        ),
      );

      return ApiResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        print(e.response);
        return ApiResponseModel.fromJson(e.response?.data);
      }

      return ApiResponseModel(
        error: true,
        message: 'Terjadi masalah yang tidak diketahui',
      );
    }
  }
}
