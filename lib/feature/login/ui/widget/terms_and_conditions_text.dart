import 'package:appclean/core/theming/styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'By logging in, you agree to our ',
        style: TextStyles.font13Graygular,
        children: [
          TextSpan(
            text: 'Terms & Conditions',
            style: TextStyles.font13darkbluemedium,
          ),
          TextSpan(
            text: ' and ',
            style: TextStyles.font13Graygular.copyWith(height: 1.5),
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyles.font13darkbluemedium,
          ),
        ],
      ),
    );
  }
}
