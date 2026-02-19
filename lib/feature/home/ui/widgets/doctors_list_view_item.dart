import 'package:appclean/core/helpers/spacing.dart';
import 'package:appclean/core/theming/styles.dart';
import 'package:appclean/feature/home/data/specialization_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListViewItem extends StatelessWidget {
  final Doctors? doctorsModel;
  const DoctorsListViewItem({super.key, this.doctorsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Image.asset(
              'assets/images/doctor_pattern.png',
              width: 110.w,
              height: 120.h,
              cacheWidth: 250,
              alignment: AlignmentGeometry.topCenter,
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpace(14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorsModel!.name ??'Name',
                  style: TextStyles.font18DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(5),
                Text('${doctorsModel?.degree}||${doctorsModel?.phone}', style: TextStyles.font12GrayMedium),
                verticalSpace(5),
                Text(
                  doctorsModel?.email??'Email',
                  style: TextStyles.font12GrayMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
