// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProjectsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectsModel _$ProjectsModelFromJson(Map<String, dynamic> json) =>
    ProjectsModel(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => ProjectsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectsModelToJson(ProjectsModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
