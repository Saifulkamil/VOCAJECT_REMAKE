// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';

import 'CollegeDetails.dart';

part 'MahasiswaDetails.g.dart';

@JsonSerializable()
class MahasiswaDetails {
   final int? id;
  final String? name;
  final String? email;
  final String? picture;
  final String? nim;
  final String? address;
  final String? phone;
  final String? role;
  final String? status;
  final CollegeDetails college;

  MahasiswaDetails({
    required this.id,
    required this.name,
    required this.email,
    required this.picture,
    required this.nim,
    required this.address,
    required this.phone,
    required this.role,
    required this.status,
    required this.college,
  });
  factory MahasiswaDetails.fromJson(Map<String, dynamic> json) => _$MahasiswaDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MahasiswaDetailsToJson(this);


}
