import 'package:appclean/core/networking/api_service.dart';
import 'package:appclean/core/networking/dio_factory.dart';
import 'package:appclean/feature/login/data/repos/login_repo.dart';
import 'package:appclean/feature/login/logic/cubit/login_cubit.dart';
import 'package:appclean/feature/signup/data/repos/sign_up_repo.dart';
import 'package:appclean/feature/signup/logic/sign_up_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  // Register your dependencies here

  //for dio and api service
  Dio dio = DioFactory.getDio();
  getIt.registerSingleton<ApiService>(ApiService(dio));
  //for login
  getIt.registerSingleton<LoginRepo>(LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //for signup
  getIt.registerSingleton<SignUpRepo>(SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
}
