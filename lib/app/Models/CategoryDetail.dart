import 'package:json_annotation/json_annotation.dart';

part 'CategoryDetail.g.dart';

@JsonSerializable()
class CategoryDetail {
   final int? id;
  final String? name;
  final String? slug;
  final String? role;

  CategoryDetail({
    required this.id,
    required this.name,
    required this.slug,
    required this.role,
  });
  factory CategoryDetail.fromJson(Map<String, dynamic> json) => _$CategoryDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDetailToJson(this);


}
