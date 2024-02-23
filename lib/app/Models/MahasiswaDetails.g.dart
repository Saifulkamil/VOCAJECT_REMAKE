// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MahasiswaDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MahasiswaDetails _$MahasiswaDetailsFromJson(Map<String, dynamic> json) =>
    MahasiswaDetails(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      picture: json['picture'] as String?,
      nim: json['nim'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      role: json['role'] as String?,
      status: json['status'] as String?,
      college: CompanyDetail.fromJson(json['college'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MahasiswaDetailsToJson(MahasiswaDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'picture': instance.picture,
      'nim': instance.nim,
      'address': instance.address,
      'phone': instance.phone,
      'role': instance.role,
      'status': instance.status,
      'college': instance.college,
    };
