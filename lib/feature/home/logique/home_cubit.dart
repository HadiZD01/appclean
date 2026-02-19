import 'package:appclean/core/networking/api_result.dart';
import 'package:appclean/feature/home/data/repos/home_repo.dart';
import 'package:appclean/feature/home/data/specialization_model.dart';
import 'package:appclean/feature/home/logique/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super((const HomeState.initial()));

  void getSpecialization() async {
    emit(HomeState.specializationLoading());
    final result = await _homeRepo.getSpecialization();
    result.when(
      success: (specializationsResponseModel) {
        emit(HomeState.specializationSuccess(specializationsResponseModel ));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationError(errorHandler));
      },
    );
  }
}
