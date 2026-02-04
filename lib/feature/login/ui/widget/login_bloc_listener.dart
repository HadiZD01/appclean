import 'package:appclean/core/helpers/extensions.dart';
import 'package:appclean/core/routing/app_router.dart';
import 'package:appclean/core/routing/routes.dart';
import 'package:appclean/core/theming/colors.dart';
import 'package:appclean/feature/login/logic/cubit/login_cubit.dart';
import 'package:appclean/feature/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            // Show loading indicator
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => Center(
                child: CircularProgressIndicator(color: ColorsApp.mainblue),
              ),
            );
          },
          success: (loginResponse) {
            // Dismiss loading indicator
            context.pop();
            // Navigate to home screen or another screen
            context.pushNamed(Routes.homescreen);
          },
          failure: (errorMessage) => {
            // Dismiss loading indicator
            context.pop(),
            // Show error message
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(errorMessage))),
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
