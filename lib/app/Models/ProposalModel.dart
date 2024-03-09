// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
import 'package:vocaject_remake_v1/app/Models/ProposalData.dart';

part 'ProposalModel.g.dart';

@JsonSerializable(explicitToJson: true)
class ProposalModel {
  final String? message;
  final ProposalData data;

  ProposalModel({
    required this.message,
    required this.data,
  });
  factory ProposalModel.fromJson(Map<String, dynamic> json) => _$ProposalModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProposalModelToJson(this);


}
