import 'package:appclean/core/networking/api_error_handler.dart';
import 'package:appclean/core/networking/api_result.dart';
import 'package:appclean/core/networking/api_service.dart';
import 'package:appclean/feature/login/data/models/login_reqeust_body.dart';
import 'package:appclean/feature/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;
  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
    LoginReqeustBody loginRequestBody,
  ) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
