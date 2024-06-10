import 'package:base_project_flutter/export.dart';

class AuthRepository {
  NetworkService service = NetworkService();

  Future<ApiResponse<LoginResponseModel>> loginUser(String email, String password) async {
    const loginUrl = ApiConstants.kBaseUrl + ApiConstants.kLogin;
    SharedPreferencesService instance = await SharedPreferencesService.getInstance();
    String fcmToken = instance.fcmToken;

    final formData = FormData.fromMap({
      'email': email,
      'password': password,
      'fcm_token': fcmToken,
    });

    try {
      final response = await service.post<LoginResponseModel>(
        loginUrl,
        body: formData,
        fromJsonT: (json) => LoginResponseModel.fromJson(json),
      );

      return response;
    } catch (e) {
      return ApiResponse(success: false, message: 'Error occurred during login: $e');
    }
  }
}
