// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectsData.dart';

part 'ProjectModelSingle.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectModelSingle {
  final String? message;
  final ProjectsData data;

  ProjectModelSingle({
    required this.message,
    required this.data,
  });
  factory ProjectModelSingle.fromJson(Map<String, dynamic> json) => _$ProjectModelSingleFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectModelSingleToJson(this);


}
