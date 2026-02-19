import 'package:appclean/core/helpers/spacing.dart';
import 'package:appclean/feature/home/logique/home_cubit.dart';
import 'package:appclean/feature/home/logique/home_state.dart';
import 'package:appclean/feature/home/ui/widgets/doctor_list_view.dart';
import 'package:appclean/feature/home/ui/widgets/doctors_speaciality_list.dart';
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
          specializationSuccess: (specializationsResponseModel) {
            var specializationList =
                specializationsResponseModel.specializationDataList;
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
  return const SizedBox(
    height: 100,
    child: Center(child: CircularProgressIndicator()),
  );
}

Widget setUpSuccess(specializationList) {
  return Expanded(
    child: Column(
      children: [
        DoctorsSpeacialityList(specializationData: specializationList ?? []),
        verticalSpace(24),
        DoctorListView(
          doctorsList: specializationList?.first?.doctorsList ?? [],
        ),
      ],
    ),
  );
}

Widget setUpError() {
  return SizedBox.shrink();
}
