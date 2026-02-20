import 'package:appclean/core/networking/api_error_handler.dart';
import 'package:appclean/core/networking/api_result.dart';
import 'package:appclean/feature/home/data/repos/home_repo.dart';
import 'package:appclean/feature/home/data/specialization_model.dart';
import 'package:appclean/feature/home/logique/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super((const HomeState.initial()));

  List<SpecializationsData?>? specializationData = [];

  void getSpecialization() async {
    emit(HomeState.specializationLoading());
    final result = await _homeRepo.getSpecialization();
    result.when(
      success: (specializationsResponseModel) {
        specializationData =
            specializationsResponseModel.specializationDataList ?? [];

        getDoctorsList(specializationId: specializationData?.first?.id ?? 0);
        emit(HomeState.specializationSuccess(specializationData));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationError(errorHandler));
      },
    );
  }

  void getDoctorsList({required  specializationId}) async {
    filterDoctorsBySpecialization(specializationId) {
      return specializationData
          ?.firstWhere(
            (specialization) => specialization?.id == specializationId,
          )
          ?.doctorsList;
    }

    List<Doctors?>? specializationDoctorsList = filterDoctorsBySpecialization(
      specializationId,
    );

    if (specializationDoctorsList != null ||
        specializationDoctorsList!.isNotEmpty) {
      emit(HomeState.doctorsSuccess(specializationDoctorsList));
    } else {
      emit(
        HomeState.doctorsError(
          ErrorHandler.handle('No doctors found for this specialization'),
        ),
      );
    }
  }
}
