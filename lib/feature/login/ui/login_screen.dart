import 'package:appclean/core/helpers/spacing.dart';
import 'package:appclean/core/theming/styles.dart';
import 'package:appclean/core/widgets/app_text_button.dart';
import 'package:appclean/feature/login/data/models/login_reqeust_body.dart';
import 'package:appclean/feature/login/logic/cubit/login_cubit.dart';
import 'package:appclean/feature/login/ui/widget/already_have_account_text.dart';
import 'package:appclean/feature/login/ui/widget/email_and_password.dart';
import 'package:appclean/feature/login/ui/widget/login_bloc_listener.dart';
import 'package:appclean/feature/login/ui/widget/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back', style: TextStyles.font24bluebold),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14grayregular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    EmailAndPassword(),
                    verticalSpace(24),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyles.font13blueregular,
                      ),
                    ),
                    verticalSpace(40),
                    AppTextButton(
                      buttontext: 'Login',
                      onpressed: () {
                        ValidateThenDoLogin(context);
                      },
                      textstyle: TextStyles.font16whitemedium,
                    ),
                    verticalSpace(20),
                    TermsAndConditionsText(),
                    verticalSpace(60),
                    AlreadyHaveAnAccountText(),
                    LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void ValidateThenDoLogin(BuildContext context) {
  final formkey = context.read<LoginCubit>().formkey;
  if (formkey.currentState!.validate()) {
    // Proceed with login
    context.read<LoginCubit>().emitloginState(
      LoginReqeustBody(
        email: context.read<LoginCubit>().emailController.text,
        password: context.read<LoginCubit>().passwordController.text,
      ),
    );
  }
}
