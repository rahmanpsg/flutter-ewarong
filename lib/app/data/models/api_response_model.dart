class ApiResponseModel {
  final bool error;
  final String message;
  final dynamic data;

  ApiResponseModel({
    required this.error,
    required this.message,
    this.data,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(
      error: json['error'] as bool,
      message: json['message'] as String,
      data: json['data'],
    );
  }
}
