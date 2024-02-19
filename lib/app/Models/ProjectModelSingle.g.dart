// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProjectModelSingle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectModelSingle _$ProjectModelSingleFromJson(Map<String, dynamic> json) =>
    ProjectModelSingle(
      message: json['message'] as String?,
      data: ProjectData.fromJson(json['data'] as Map<String, dynamic>)
    );

Map<String, dynamic> _$ProjectModelSingleToJson(ProjectModelSingle instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.toJson(),
    };
