// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProjectTaskDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectTaskDetail _$ProjectTaskDetailFromJson(Map<String, dynamic> json) =>
    ProjectTaskDetail(
      id: json['id'] as int?,
      checked: json['checked'] as bool?,
      title: json['title'] as String?,
      project: ProjectData.fromJson(json['project'] as Map<String, dynamic>),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ProjectTaskDetailToJson(ProjectTaskDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'checked': instance.checked,
      'project': instance.project.toJson(),
    };
