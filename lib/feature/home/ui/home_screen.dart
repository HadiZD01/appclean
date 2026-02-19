import 'package:appclean/core/helpers/spacing.dart';
import 'package:appclean/feature/home/ui/widgets/doctors_blue_container.dart';
import 'package:appclean/feature/home/ui/widgets/doctors_speaciality_see_all.dart';
import 'package:appclean/feature/home/ui/widgets/home_top_bar.dart';
import 'package:appclean/feature/home/ui/widgets/specialization_and_doctors_bloc_builder.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20, 16, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTopBar(),
              DoctorsBlueContainer(),
              verticalSpace(24),
              DoctorsSpeacialitySeeAll(),
              verticalSpace(24),
              SpecializationAndDoctorsBlocBuilder(),
              // DoctorsSpeacialityList(),
              // verticalSpace(24),
              // DoctorListView(),
            ],
          ),
        ),
      ),
    );
  }
}
