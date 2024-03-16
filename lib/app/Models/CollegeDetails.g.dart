// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CollegeDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollegeDetails _$CollegeDetailsFromJson(Map<String, dynamic> json) =>
    CollegeDetails(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      picture: json['picture'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      role: json['role'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CollegeDetailsToJson(CollegeDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'picture': instance.picture,
      'description': instance.description,
      'address': instance.address,
      'phone': instance.phone,
      'role': instance.role,
      'status': instance.status,
    };
