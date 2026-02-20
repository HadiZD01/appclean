import 'package:appclean/core/helpers/constants.dart';
import 'package:appclean/core/helpers/shared_pref_helper.dart';
import 'package:appclean/core/networking/api_result.dart';
import 'package:appclean/core/networking/dio_factory.dart';
import 'package:appclean/feature/login/data/models/login_reqeust_body.dart';
import 'package:appclean/feature/login/data/repos/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:appclean/feature/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  final formkey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void emitloginState() async {
    emit(LoginState.loading());
    final result = await _loginRepo.login(
      LoginReqeustBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    result.when(
      success: (loginResponse) async {
        await saveUserToken(loginResponse.userData.token);
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.failure(errorMessage: error.apiErrorModel.message));
      },
    );
  }

  Future<void> saveUserToken(token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenAfterLogin(token);
  }
}
