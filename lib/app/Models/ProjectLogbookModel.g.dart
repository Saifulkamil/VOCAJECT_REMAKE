// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProjectLogbookModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectLogbookModel _$ProjectLogbookModelFromJson(Map<String, dynamic> json) =>
    ProjectLogbookModel(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => ProjectLogbookDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectLogbookModelToJson(
        ProjectLogbookModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
