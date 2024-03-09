// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
import 'package:vocaject_remake_v1/app/Models/MahasiswaDetails.dart';

part 'ListMahasiswaModel.g.dart';

@JsonSerializable()
class ListMahasiswaModel {
   final String? message;
  final List<MahasiswaDetails> data;


  ListMahasiswaModel({
    required this.message,
    required this.data,
 
  });
  factory ListMahasiswaModel.fromJson(Map<String, dynamic> json) => _$ListMahasiswaModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListMahasiswaModelToJson(this);


}
