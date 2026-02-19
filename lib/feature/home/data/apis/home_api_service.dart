import 'package:appclean/core/networking/api_constant.dart';
import 'package:appclean/feature/home/data/apis/home_api_constant.dart';
import 'package:appclean/feature/home/data/specialization_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';


part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstant.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(HomeApiConstant.specializationEP)
  Future<SpecializationsResponseModel> getSpecialization();
}
