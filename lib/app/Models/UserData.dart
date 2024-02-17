import 'package:json_annotation/json_annotation.dart';
import 'package:vocaject_remake_v1/app/Models/UserDetail.dart';


part 'UserData.g.dart';

@JsonSerializable(explicitToJson: true)
class UserData {
  final String? access_token;
  final UserDetail user;

  UserData({
    required this.access_token,
    required this.user,
  });
  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
