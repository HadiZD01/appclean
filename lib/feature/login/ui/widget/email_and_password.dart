import 'package:appclean/core/helpers/app_regex.dart';
import 'package:appclean/core/helpers/spacing.dart';
import 'package:appclean/core/widgets/app_text_form_filed.dart';
import 'package:appclean/feature/login/logic/cubit/login_cubit.dart';
import 'package:appclean/feature/login/ui/widget/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  // final formkey = GlobalKey<FormState>();

  static bool obscureText = true;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasDigit = false;
  bool hasMinLength = false;
  bool hasSpecialChar = false;

  late TextEditingController passwordController;

  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasDigit = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
        hasSpecialChar = AppRegex.hasSpecialCharacter(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formkey,
      child: Column(
        children: [
          AppTextFormFiled(
            hintText: 'Email Address',
            validator: (value) {
              if (value == '' ||
                  value!.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Email is required';
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormFiled(
            controller: context.read<LoginCubit>().passwordController,
            hintText: 'Password',
            obscureText: obscureText,
            suffixIcon: GestureDetector(
              onTap: () => {
                setState(() {
                  obscureText = !obscureText;
                }),
              },
              child: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == '' || value!.isEmpty) {
                return 'Password is required';
              }
            },
          ),
          verticalSpace(24),
          PasswordValidations(
            hasLowercase: hasLowercase,
            hasUppercase: hasUppercase,
            hasDigit: hasDigit,
            hasMinLength: hasMinLength,
            hasSpecialChar: hasSpecialChar,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
