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
  final selectedIndex;
  const DoctorsSpecialityListViewItem({
    super.key,
    required this.specializationData,
    required this.itemIndex,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        children: [
          itemIndex == selectedIndex
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsApp.DarkBlue),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: ColorsApp.LigherGray,
                    child: SvgPicture.asset(
                      'assets/svgs/notification.svg',
                      height: 42.h,
                      width: 42.w,
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorsApp.LigherGray,
                  child: SvgPicture.asset(
                    'assets/svgs/notification.svg',
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
          verticalSpace(8),
          Text(
            specializationData?.name ?? 'Specialization',
            style: itemIndex == selectedIndex
                ? TextStyles.font14DarkblueBold
                : TextStyles.font12DarkblueRegular,
          ),
        ],
      ),
    );
  }
}
