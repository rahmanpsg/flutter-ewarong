class ApiResponseModel {
  final bool error;
  final String message;
  final Map<String, dynamic>? errors;
  final dynamic data;

  ApiResponseModel({
    required this.error,
    required this.message,
    this.errors,
    this.data,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(
      error: json['error'] as bool,
      message: json['message'] ?? "",
      errors: json['errors'],
      data: json['data'],
    );
  }

  String get errorMessage {
    if (error) {
      if (errors != null) {
        return errors!.entries
            .map((error) =>
                "${error.key.toUpperCase()}: ${error.value.toString().toUpperCase()}")
            .join("\n");
      } else {
        return message;
      }
    } else {
      return "";
    }
  }
}
