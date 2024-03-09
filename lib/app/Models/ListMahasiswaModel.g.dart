// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListMahasiswaModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListMahasiswaModel _$ListMahasiswaModelFromJson(Map<String, dynamic> json) =>
    ListMahasiswaModel(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => MahasiswaDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListMahasiswaModelToJson(ListMahasiswaModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
