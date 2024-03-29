// ignore_for_file: file_names, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:vocaject_remake_v1/app/Models/CategoryDetail.dart';
import 'package:vocaject_remake_v1/app/Models/CompanyDetail.dart';
import 'package:vocaject_remake_v1/app/Models/MahasiswaDetails.dart';

part 'ProjectData.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectData {
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
  final List<MahasiswaDetails> members;

  ProjectData({
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
    required this.members,
  });
  factory ProjectData.fromJson(Map<String, dynamic> json) =>
      _$ProjectDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDataToJson(this);
}
