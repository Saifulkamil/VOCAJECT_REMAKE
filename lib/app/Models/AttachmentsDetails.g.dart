// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AttachmentsDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachmentsDetails _$AttachmentsDetailsFromJson(Map<String, dynamic> json) =>
    AttachmentsDetails(
      id: json['id'] as int?,
      proposal_id: json['proposal_id'] as int?,
      filepath: json['filepath'] as String?,
      filename: json['filename'] as String?,
      mimetype: json['mimetype'] as String?,
    );

Map<String, dynamic> _$AttachmentsDetailsToJson(AttachmentsDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'proposal_id': instance.proposal_id,
      'filepath': instance.filepath,
      'filename': instance.filename,
      'mimetype': instance.mimetype,
    };
