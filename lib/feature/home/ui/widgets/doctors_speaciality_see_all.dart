import 'package:appclean/core/theming/styles.dart';
import 'package:flutter/material.dart';

class DoctorsSpeacialitySeeAll extends StatelessWidget {
  const DoctorsSpeacialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Doctors Speciality",style: TextStyles.font18DarkblueSemiBold,),
        Spacer(),
        Text("See All",style: TextStyles.font12BlueRegular,)
      ],
    );
  }
}