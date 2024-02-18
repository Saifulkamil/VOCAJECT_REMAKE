import 'package:json_annotation/json_annotation.dart';
import 'package:vocaject_remake_v1/app/Models/CategoryDetail.dart';
import 'package:vocaject_remake_v1/app/Models/CompanyDetail.dart';

part 'ProjectData.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectData {
  final int? id;
  final int? budget;
  final String? title;
  final String? description;
  final String? expired_at;
  final String? deadline_at;
  final CompanyDetail company;
  final CategoryDetail category;
  final String? status;

  ProjectData({
    required this.id,
    required this.budget,
    required this.title,
    required this.description,
    required this.expired_at,
    required this.deadline_at,
    required this.company,
    required this.category,
    required this.status,
  });
  factory ProjectData.fromJson(Map<String, dynamic> json) => _$ProjectDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDataToJson(this);


}
