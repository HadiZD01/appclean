import 'package:appclean/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_state.freezed.dart';

@freezed
class SignUpState<T> with _$SignUpState<T> {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.signUploading() = SignUploading;
  const factory SignUpState.signUpSuccess(T data) = SignUpSuccess<T>;
  const factory SignUpState.signUpFailure(ApiErrorModel apiErrorModel) =
      SignUpError;
}
