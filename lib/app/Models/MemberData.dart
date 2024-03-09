// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
import 'package:vocaject_remake_v1/app/Models/MahasiswaDetails.dart';

part 'MemberData.g.dart';

@JsonSerializable()
class MemberData {
   final MahasiswaDetails members;


  MemberData({
    required this.members,
 
  });
  factory MemberData.fromJson(Map<String, dynamic> json) => _$MemberDataFromJson(json);

  Map<String, dynamic> toJson() => _$MemberDataToJson(this);


}
