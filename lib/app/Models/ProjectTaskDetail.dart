// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';

import 'ProjectsData.dart';

part 'ProjectTaskDetail.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectTaskDetail {
  final int? id;
  String? title;
  final String? description;
  bool? checked;
  final ProjectsData project;

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
