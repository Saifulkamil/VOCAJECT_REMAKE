// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectTaskDetail.dart';

part 'ProjectTaskModel.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectTaskModel {
  final String? message;
  final List<ProjectTaskDetail> data;

  ProjectTaskModel({
    required this.message,
    required this.data,
  });
  factory ProjectTaskModel.fromJson(Map<String, dynamic> json) => _$ProjectTaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectTaskModelToJson(this);


}
