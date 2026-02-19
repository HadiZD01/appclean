import 'package:appclean/core/helpers/spacing.dart';
import 'package:appclean/core/theming/colors.dart';
import 'package:appclean/core/theming/styles.dart';
import 'package:appclean/feature/home/data/specialization_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorsSpecialityListViewItem extends StatelessWidget {
  final SpecializationsData? specializationData;
  final itemIndex;
  const DoctorsSpecialityListViewItem({
    super.key,
    required this.specializationData,required this.itemIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: ColorsApp.LigherGray,
            child: SvgPicture.asset(
              'assets/svgs/notification.svg',
              height: 40.h,
              width: 40.w,
            ),
          ),
          verticalSpace(8),
          Text(specializationData?.name??'Specialization', style: TextStyles.font12DarkblueRegular),
        ],
      ),
    );
  }
}
