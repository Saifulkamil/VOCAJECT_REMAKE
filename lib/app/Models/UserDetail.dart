import 'package:json_annotation/json_annotation.dart';

part "UserDetail.g.dart";

@JsonSerializable()
class UserDetail {
  final int? id;
  final String? name;
  final String? email;
  final String? picture;
  final String? address;
  final String? description;
  final String? phone;
  final String? role;
  final String? status;

  UserDetail({
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
  factory UserDetail.fromJson(Map<String, dynamic> json) => _$UserDetailFromJson(json);
  Map<String, dynamic> toJson() => _$UserDetailToJson(this);

}
