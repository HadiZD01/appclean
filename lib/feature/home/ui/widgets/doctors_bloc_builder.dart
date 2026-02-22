import 'package:appclean/feature/home/logique/home_cubit.dart';
import 'package:appclean/feature/home/logique/home_state.dart';
import 'package:appclean/feature/home/ui/widgets/doctor_list_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return current is DoctorsSuccess || current is DoctorsError;
      },
      builder: (context, state) {
        return state.maybeWhen(
          doctorsSuccess: (doctorsList) {
            return setUpSuccess(doctorsList);
          },
          doctorsError: () {
            return setUpError();
          },
          orElse: () {
            return SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setUpSuccess(doctorsList) {
    return DoctorListView(doctorsList: doctorsList);
  }

  Widget setUpError() {
    return SizedBox.shrink();
  }
}
