import 'package:json_annotation/json_annotation.dart';
import 'package:vocaject_remake_v1/app/Models/CategoryDetail.dart';
import 'package:vocaject_remake_v1/app/Models/CompanyDetail.dart';

import 'ProjectData.dart';

part 'ProjectTaskDetail.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectTaskDetail {
  final int? id;
  final String? title;
  final String? description;
  final bool? checked;
  final ProjectData project;

  ProjectTaskDetail({
    required this.id,
    required this.checked,
    required this.title,
    required this.project,
    required this.description,
  });
  factory ProjectTaskDetail.fromJson(Map<String, dynamic> json) =>
      _$ProjectTaskDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectTaskDetailToJson(this);
}
