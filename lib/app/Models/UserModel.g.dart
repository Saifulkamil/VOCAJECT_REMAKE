// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      message: json['message'] as String?,
      data: UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'message': instance.message,
      'data': instance.data.toJson(),
    };
