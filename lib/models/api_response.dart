abstract class Serializable {
  Map<String, dynamic> toJson();
}

class ApiResponse<T extends Serializable> {
  bool success;
  String? message;
  List<ErrorResponseModel>? error;
  T? data;

  ApiResponse({this.message, this.data, required this.success, this.error});

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) create) {
    return ApiResponse<T>(
      message: json["message"],
      success: json["success"],
      data: json["data"] != null ? create(json["data"]) : null,
      error: json["errors"] == null
          ? null
          : List<ErrorResponseModel>.from(json["errors"].map((x) => ErrorResponseModel.fromJson(x))),
    );
  }
}

class ErrorResponseModel {
  int? code;
  String? message;

  ErrorResponseModel({
    required this.code,
    required this.message,
  });

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) {
    return ErrorResponseModel(code: json['code'], message: json['message']);
  }
}
