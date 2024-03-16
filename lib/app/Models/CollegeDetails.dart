// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';

part 'CollegeDetails.g.dart';

@JsonSerializable()
class CollegeDetails {
  final int? id;
  final String? name;
  final String? email;
  final String? picture;
  final String? description;
  final String? address;
  final String? phone;
  final String? role;
  final String? status;

  CollegeDetails({
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
  factory CollegeDetails.fromJson(Map<String, dynamic> json) => _$CollegeDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CollegeDetailsToJson(this);


}
