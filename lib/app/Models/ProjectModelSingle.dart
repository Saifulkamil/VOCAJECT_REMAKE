import 'package:json_annotation/json_annotation.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectData.dart';

part 'ProjectModelSingle.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectModelSingle {
  final String? message;
  final ProjectData data;

  ProjectModelSingle({
    required this.message,
    required this.data,
  });
  factory ProjectModelSingle.fromJson(Map<String, dynamic> json) => _$ProjectModelSingleFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectModelSingleToJson(this);


}
