import 'package:appclean/core/theming/styles.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccountText extends StatelessWidget {
  const AlreadyHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Don't have an account? ",
            style: TextStyles.font13DarkblueRegular,
          ),
          TextSpan(text: "Sign Up", style: TextStyles.font13bluesemibold),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
