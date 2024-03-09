// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
import 'package:vocaject_remake_v1/app/Models/UserData.dart';

part 'UserModel.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  final String? message;
  final UserData data;

  UserModel({
    required this.message,
    required this.data,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}
