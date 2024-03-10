// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';

import 'ProjectsData.dart';

part 'ProjectsModel.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectsModel {
  final String? message;
  final List<ProjectsData> data;

  ProjectsModel({
    required this.message,
    required this.data,
  });
  factory ProjectsModel.fromJson(Map<String, dynamic> json) => _$ProjectsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectsModelToJson(this);


}
