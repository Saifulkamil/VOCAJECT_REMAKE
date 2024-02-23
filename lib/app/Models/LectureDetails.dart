import 'package:json_annotation/json_annotation.dart';

import 'CompanyDetail.dart';

part 'LectureDetails.g.dart';

@JsonSerializable()
class LectureDetails {
   final int? id;
  final String? name;
  final String? email;
  final String? picture;
  final String? nidn;
  final String? address;
  final String? phone;
  final String? role;
  final String? status;
  final CompanyDetail college;

  LectureDetails({
    required this.id,
    required this.name,
    required this.email,
    required this.picture,
    required this.nidn,
    required this.address,
    required this.phone,
    required this.role,
    required this.status,
    required this.college,
  });
  factory LectureDetails.fromJson(Map<String, dynamic> json) => _$LectureDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$LectureDetailsToJson(this);


}
