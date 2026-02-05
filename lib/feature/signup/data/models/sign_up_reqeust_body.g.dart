// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_reqeust_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpReqeustBody _$SignUpReqeustBodyFromJson(Map<String, dynamic> json) =>
    SignUpReqeustBody(
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
      name: json['name'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
      gender: (json['gender'] as num).toInt(),
    );

Map<String, dynamic> _$SignUpReqeustBodyToJson(SignUpReqeustBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'name': instance.name,
      'password_confirmation': instance.passwordConfirmation,
      'gender': instance.gender,
    };
