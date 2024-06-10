import 'dart:developer';

import 'package:base_project_flutter/export.dart';

class NetworkService {
  NetworkService._();

  factory NetworkService() => _instance;
  static final NetworkService _instance = NetworkService._();

  final Dio dio = Dio();

  void init() {
    // SharedPreferencesService instance = await SharedPreferencesService.getInstance();
    // String fcmToken = instance.fcmToken;

    final options = BaseOptions(
      baseUrl: ApiConstants.kBaseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Content-Type": "application/json",
        // "Authorization": fcmToken,
      },
      responseType: ResponseType.json,
      followRedirects: false,
      receiveDataWhenStatusError: true,
    );

    dio.options = options;
  }

  Future<ApiResponse<T>> post<T extends Serializable>(String url,
      {FormData? body, required T Function(Map<String, dynamic>) fromJsonT}) async {
    try {
      if (body != null) {
        final data = body.fields.map((field) => "${field.key}:${field.value}").join('\n');
        logRequest('POST', url, data);
      }

      final response = await dio.post(url, data: body);
      logResponse('POST', url, response);
      return _returnResponse<T>(response, fromJsonT);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  Future<ApiResponse<T>> get<T extends Serializable>(String url,
      {required T Function(Map<String, dynamic>) fromJsonT}) async {
    try {
      logRequest('GET', url, null);
      final response = await dio.get(url);
      logResponse('GET', url, response);
      return _returnResponse<T>(response, fromJsonT);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  ApiResponse<T> _returnResponse<T extends Serializable>(
      Response response, T Function(Map<String, dynamic>) fromJsonT) {
    switch (response.statusCode) {
      case 200:
        final responseJson = json.decode(jsonEncode(response.data));

        return ApiResponse.fromJson(responseJson, fromJsonT);
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
        userUnAuthorized();
        throw UnauthorisedException(response.data.toString());
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communicating with the server with status code: ${response.statusCode}');
    }
  }

  ApiResponse<T> _handleError<T extends Serializable>(dynamic error) {
    if (error is SocketException) {
      debugPrint('No internet connection');
      return ApiResponse(success: false, message: 'No internet connection');
    } else if (error is DioException) {
      debugPrint('DioException: ${error.response!.statusCode}');
      if (error.response!.statusCode == 401) {
        userUnAuthorized();
      }
      return ApiResponse(success: false, message: 'Request error: ${error.message}');
    } else {
      debugPrint('API error: $error');
      return ApiResponse(success: false, message: 'Unexpected error: $error');
    }
  }

  void logRequest(String method, String url, String? queryParameters) {
    log(
      "\n>>>>>>>>>>>>>>>>[REQUEST]>>>>>>>>>>>>>>>>\n"
      "METHOD  ==> $method : $url \n"
      "Header  ==> ${dio.options.headers}\n"
      "Query    ==> ${queryParameters ?? 'No queryParameters'}\n"
      ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>",
    );
  }

  void logResponse(String method, String url, Response response) {
    log(
      "\n<<<<<<<<<<<<<<<[RESPONSE]<<<<<<<<<<<<<<<<\n"
      "METHOD     ==> $method : $url\n"
      "STATUS     ==> ${response.statusCode}\n"
      "BODY       ==> ${jsonEncode(response.data)}\n"
      "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<",
    );
  }

  userUnAuthorized() {
    // SharedPreferencesService.instance!.clear();

    // showSessionExpiredDialog(get_x.Get.context!);
    // showSnackBar(title: session_expired,color: Colors.red);
  }
}

class ApiConstants {
  static const kHostUrl = "https://namastestag.vrinsoft.in";
  static const kVersion = "/api/v1/";
  static const kBaseUrl = "$kHostUrl$kVersion";
  static const kSocketUrl = "ws://namaste.socket.vrinsoft.in:8020";

  // utils
  static const String kLabel = "labels";
  static const String kGeneralSettings = "general-settings";

  // authentication
  static const String kSignin = "signin";
  static const String kLogin = "login";
  static const String kLogout = "logout";
  static const String kForgotPassword = "forgot-password";
  static const String kResetPassword = "reset-password";
  static const String kDeleteAccount = "delete-account";
}
