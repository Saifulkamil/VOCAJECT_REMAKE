// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProjectModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) => ProjectModel(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => ProjectData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectModelToJson(ProjectModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
