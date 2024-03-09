// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';

part 'CompanyDetail.g.dart';

@JsonSerializable()
class CompanyDetail {
  final int? id;
  final String? name;
  final String? email;
  final String? picture;
  final String? description;
  final String? address;
  final String? phone;
  final String? role;
  final String? status;

  CompanyDetail({
    required this.id,
    required this.name,
    required this.email,
    required this.picture,
    required this.description,
    required this.address,
    required this.phone,
    required this.role,
    required this.status,
  });
  factory CompanyDetail.fromJson(Map<String, dynamic> json) => _$CompanyDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyDetailToJson(this);


}
