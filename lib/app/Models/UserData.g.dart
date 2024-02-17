// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      access_token: json['access_token'] as String?,
      user: UserDetail.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'access_token': instance.access_token,
      'user': instance.user.toJson(),
    };
