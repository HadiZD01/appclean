import 'package:appclean/core/helpers/spacing.dart';
import 'package:appclean/core/theming/colors.dart';
import 'package:appclean/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorsSpeacialityList extends StatelessWidget {
  const DoctorsSpeacialityList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorsApp.LigherGray,
                  child: SvgPicture.asset(
                    'assets/svgs/Kindeys.svg',
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
                verticalSpace(8),
                Text("General", style: TextStyles.font12DarkblueRegular),
              ],
            ),
          );
        },
      ),
    );
  }
}
