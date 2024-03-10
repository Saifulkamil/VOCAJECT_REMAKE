// ignore_for_file: file_names, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:vocaject_remake_v1/app/Models/CategoryDetail.dart';
import 'package:vocaject_remake_v1/app/Models/CompanyDetail.dart';

part 'ProjectsData.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectsData {
  final int? id;
  final int? progress;
  final int? budget;
  final String? title;
  final String? description;
  final String? expired_at;
  final String? deadline_at;
  final CompanyDetail company;
  final CategoryDetail category;
  final String? status;

  ProjectsData({
    required this.id,
    required this.progress,
    required this.budget,
    required this.title,
    required this.description,
    required this.expired_at,
    required this.deadline_at,
    required this.company,
    required this.category,
    required this.status,
  });
  factory ProjectsData.fromJson(Map<String, dynamic> json) =>
      _$ProjectsDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectsDataToJson(this);
}
