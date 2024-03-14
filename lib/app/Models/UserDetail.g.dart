// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) => UserDetail(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      picture: json['picture'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      nim: json['nim'] as String?,
      nidn: json['nidn'] as String?,
      role: json['role'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'picture': instance.picture,
      'address': instance.address,
      'nim': instance.nim,
      'nidn': instance.nidn,
      'description': instance.description,
      'phone': instance.phone,
      'role': instance.role,
      'status': instance.status,
    };
