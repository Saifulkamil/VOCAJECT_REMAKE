// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProjectData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectData _$ProjectDataFromJson(Map<String, dynamic> json) => ProjectData(
      id: json['id'] as int?,
      progress: json['progress'] as int?,
      budget: json['budget'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      expired_at: json['expired_at'] as String?,
      deadline_at: json['deadline_at'] as String?,
      company: CompanyDetail.fromJson(json['company'] as Map<String, dynamic>),
      category:
          CategoryDetail.fromJson(json['category'] as Map<String, dynamic>),
      status: json['status'] as String?,
      members: (json['members'] as List<dynamic>)
          .map((e) => MahasiswaDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectDataToJson(ProjectData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'progress': instance.progress,
      'budget': instance.budget,
      'title': instance.title,
      'description': instance.description,
      'expired_at': instance.expired_at,
      'deadline_at': instance.deadline_at,
      'company': instance.company.toJson(),
      'category': instance.category.toJson(),
      'status': instance.status,
      'members': instance.members.map((e) => e.toJson()).toList(),
    };
