// ignore_for_file: file_names, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'ProjectLogbookDetail.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectLogbookDetail {
  final int? id;
  final String? submited_at;
  final String? description;

  ProjectLogbookDetail({
    required this.id,
    required this.submited_at,
    required this.description,
  });
  factory ProjectLogbookDetail.fromJson(Map<String, dynamic> json) =>
      _$ProjectLogbookDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectLogbookDetailToJson(this);
}
