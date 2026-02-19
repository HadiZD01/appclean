import 'package:appclean/feature/home/data/specialization_model.dart';
import 'package:appclean/feature/home/ui/widgets/doctors_speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsSpeacialityList extends StatelessWidget {
  final List<SpecializationsData?> specializationData;
  const DoctorsSpeacialityList({super.key, required this.specializationData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationData.length,
        itemBuilder: (BuildContext context, int index) {
          return DoctorsSpecialityListViewItem(
            specializationData: specializationData[index],
            itemIndex: index,
          );
        },
      ),
    );
  }
}
