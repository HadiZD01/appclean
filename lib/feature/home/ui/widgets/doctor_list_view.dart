import 'package:appclean/core/helpers/spacing.dart';
import 'package:appclean/core/theming/styles.dart';
import 'package:appclean/feature/home/data/specialization_model.dart';
import 'package:appclean/feature/home/ui/widgets/doctors_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorListView extends StatelessWidget {
  final List<Doctors?> doctorsList;
  const DoctorListView({super.key, required this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList.length,
        itemBuilder: (BuildContext context, int index) {
          return DoctorsListViewItem(
            doctorsModel: doctorsList[index],
          );
        },
      ),
    );
  }
}
