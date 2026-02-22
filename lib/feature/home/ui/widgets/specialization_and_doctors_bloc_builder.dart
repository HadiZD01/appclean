import 'package:appclean/core/helpers/spacing.dart';
import 'package:appclean/feature/home/logique/home_cubit.dart';
import 'package:appclean/feature/home/logique/home_state.dart';
import 'package:appclean/feature/home/ui/widgets/doctor_list_view.dart';
import 'package:appclean/feature/home/ui/widgets/doctors_shimmer_loading.dart';
import 'package:appclean/feature/home/ui/widgets/doctors_speaciality_list.dart';
import 'package:appclean/feature/home/ui/widgets/speciality_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.maybeWhen(
          specializationLoading: () {
            return setUpLoading();
          },
          specializationSuccess: (specializationDataList) {
            var specializationList = specializationDataList;
            return setUpSuccess(specializationList);
          },
          specializationError: (errorHandler) {
            return setUpError();
          },
          orElse: () {
            return SizedBox.shrink();
          },
        );
      },
    );
  }
}

Widget setUpLoading() {
  return Expanded(
    child: Column(
      children: [
        SpecialityShimmerLoading(),
        verticalSpace(8),
        DoctorsShimmerLoading(),
      ],
    ),
  );
}

Widget setUpSuccess(specializationList) {
  return DoctorsSpeacialityList(specializationData: specializationList ?? []);
}

Widget setUpError() {
  return SizedBox.shrink();
}
