// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProjectLogbookDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectLogbookDetail _$ProjectLogbookDetailFromJson(
        Map<String, dynamic> json) =>
    ProjectLogbookDetail(
      id: json['id'] as int?,
      submited_at: json['submited_at'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ProjectLogbookDetailToJson(
        ProjectLogbookDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'submited_at': instance.submited_at,
      'description': instance.description,
    };
