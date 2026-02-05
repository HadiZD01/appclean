import 'package:appclean/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/svgs/background.svg'),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.white, Colors.white.withOpacity(0.0)],
              stops: const [0.14, 0.4],
            ),
          ),
          child: Image.asset("assets/images/doctor_image.png"),
        ),
        Positioned(
          bottom: 30,
          right: 0,
          left: 0,

          child: Text(
            "Best Doctor\nAppointment App",
            style: TextStyles.font32bluebold,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
