// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';

import 'ProjectLogbookDetail.dart';

part 'ProjectLogbookModel.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectLogbookModel {
  final String? message;
  final List<ProjectLogbookDetail> data;

  ProjectLogbookModel({
    required this.message,
    required this.data,
  });
  factory ProjectLogbookModel.fromJson(Map<String, dynamic> json) => _$ProjectLogbookModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectLogbookModelToJson(this);


}
