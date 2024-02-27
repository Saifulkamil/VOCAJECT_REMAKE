// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProjectTaskModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectTaskModel _$ProjectTaskModelFromJson(Map<String, dynamic> json) =>
    ProjectTaskModel(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => ProjectTaskDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectTaskModelToJson(ProjectTaskModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
