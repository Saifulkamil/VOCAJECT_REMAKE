// ignore_for_file: file_names, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'AttachmentsDetails.g.dart';

@JsonSerializable()
class AttachmentsDetails {
   final int? id;
   final int? proposal_id;
  final String? filepath;
  final String? filename;
  final String? mimetype;

  AttachmentsDetails({
    required this.id,
    required this.proposal_id,
    required this.filepath,
    required this.filename,
    required this.mimetype,
  });
  factory AttachmentsDetails.fromJson(Map<String, dynamic> json) => _$AttachmentsDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentsDetailsToJson(this);


}
