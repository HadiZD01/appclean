import 'package:appclean/core/networking/api_error_handler.dart';
import 'package:appclean/core/networking/api_result.dart';
import 'package:appclean/feature/home/data/apis/home_api_service.dart';
import 'package:appclean/feature/home/data/specialization_model.dart';

class HomeRepo {
  final HomeApiService _homeApiService;
  HomeRepo(this._homeApiService);
  Future<ApiResult<SpecializationsResponseModel>> getSpecialization() async {
    try {
      final response = await _homeApiService.getSpecialization();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    } 
  }
}
