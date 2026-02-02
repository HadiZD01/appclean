import 'package:appclean/core/helpers/spacing.dart';
import 'package:appclean/core/theming/styles.dart';
import 'package:appclean/core/widgets/app_text_button.dart';
import 'package:appclean/core/widgets/app_text_form_filed.dart';
import 'package:appclean/feature/login/ui/widget/already_have_account_text.dart';
import 'package:appclean/feature/login/ui/widget/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  static bool obscureText = true;
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
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      AppTextFormFiled(hintText: 'Email Address'),
                      verticalSpace(18),
                      AppTextFormFiled(
                        hintText: 'Password',
                        obscureText: obscureText,
                        suffixIcon: GestureDetector(
                          onTap: () => {
                            setState(() {
                              obscureText = !obscureText;
                            }),
                          },
                          child: Icon(
                            obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
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
                        onpressed: () {},
                        textstyle: TextStyles.font16whitemedium,
                      ),
                      verticalSpace(20),
                      TermsAndConditionsText(),
                      verticalSpace(60),
                      AlreadyHaveAnAccountText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
