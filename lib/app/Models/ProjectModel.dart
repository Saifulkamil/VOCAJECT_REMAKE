import 'package:json_annotation/json_annotation.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectData.dart';

part 'ProjectModel.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectModel {
  final String? message;
  final List<ProjectData> data;

  ProjectModel({
    required this.message,
    required this.data,
  });
  factory ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);


}
