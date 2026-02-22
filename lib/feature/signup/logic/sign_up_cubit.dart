import 'package:appclean/core/networking/api_result.dart';
import 'package:appclean/feature/signup/data/models/sign_up_reqeust_body.dart';
import 'package:appclean/feature/signup/data/repos/sign_up_repo.dart';
import 'package:appclean/feature/signup/logic/sign_up_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formkey = GlobalKey<FormState>();

  void emitSignUpState() async {
    emit(SignUpState.signUploading());
    final response = await _signUpRepo.signUp(
      SignUpReqeustBody(
        email: emailController.text,
        password: passwordController.text,
        phone: phoneController.text,
        name: nameController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 0,
      ),
    );

    response.when(
      success: (signUpResponse) {
        emit(SignUpState.signUpSuccess(signUpResponse));
      },
      failure: (apiErrorModel) {
        emit(
          SignUpState.signUpFailure(apiErrorModel),
        );
      },
    );
  }
}
