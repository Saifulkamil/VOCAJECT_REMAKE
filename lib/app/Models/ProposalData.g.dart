// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProposalData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposalData _$ProposalDataFromJson(Map<String, dynamic> json) => ProposalData(
      id: json['id'] as int?,
      note: json['note'] as String?,
      status: json['status'] as String?,
      project: ProjectData.fromJson(json['project'] as Map<String, dynamic>),
      lecture: LectureDetails.fromJson(json['lecture'] as Map<String, dynamic>),
      members: (json['members'] as List<dynamic>)
          .map((e) => MahasiswaDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachments: (json['attachments'] as List<dynamic>)
          .map((e) => AttachmentsDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProposalDataToJson(ProposalData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'note': instance.note,
      'status': instance.status,
      'project': instance.project.toJson(),
      'lecture': instance.lecture.toJson(),
      'members': instance.members.map((e) => e.toJson()).toList(),
      'attachments': instance.attachments.map((e) => e.toJson()).toList(),
    };
