import 'package:appclean/feature/home/data/specialization_model.dart';
import 'package:appclean/feature/home/logique/home_cubit.dart';
import 'package:appclean/feature/home/ui/widgets/doctors_speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsSpeacialityList extends StatefulWidget {
  final List<SpecializationsData?> specializationData;
  const DoctorsSpeacialityList({super.key, required this.specializationData});

  @override
  State<DoctorsSpeacialityList> createState() => _DoctorsSpeacialityListState();
}

class _DoctorsSpeacialityListState extends State<DoctorsSpeacialityList> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationData.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            key: ValueKey(widget.specializationData[index]?.id),
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              context.read<HomeCubit>().getDoctorsList(
                specializationId: widget.specializationData[index]?.id,
              );
            },

            child: DoctorsSpecialityListViewItem(
              specializationData: widget.specializationData[index],
              itemIndex: index,
              selectedIndex: selectedIndex,
            ),
          );
        },
      ),
    );
  }
}
