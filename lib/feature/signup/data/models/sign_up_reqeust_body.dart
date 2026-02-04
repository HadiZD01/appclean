import 'package:json_annotation/json_annotation.dart';
part 'sign_up_reqeust_body.g.dart';

@JsonSerializable()
class SignUpReqeustBody {
  final String email;
  final String password;
  final String phone;
  final String name;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;
  final int gender;
  SignUpReqeustBody({
    required this.email,
    required this.password,
    required this.phone,
    required this.name,
    required this.passwordConfirmation,
    required this.gender,
  });

  Map<String, dynamic> toJson() => _$SignUpReqeustBodyToJson(this);
}
