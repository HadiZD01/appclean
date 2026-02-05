import 'package:appclean/core/networking/api_error_handler.dart';
import 'package:appclean/core/networking/api_result.dart';
import 'package:appclean/core/networking/api_service.dart';
import 'package:appclean/feature/signup/data/models/sign_up_reqeust_body.dart';
import 'package:appclean/feature/signup/data/models/sign_up_response_body.dart';

class SignUpRepo {
  ApiService _apiService;
  SignUpRepo(this._apiService);

  Future<ApiResult<SignUpResponse>> signUp(
    SignUpReqeustBody signUpReqeustBody,
  ) async {
    try {
      final response = await _apiService.signup(signUpReqeustBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}