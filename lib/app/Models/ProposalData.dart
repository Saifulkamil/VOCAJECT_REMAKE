// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
import 'package:vocaject_remake_v1/app/Models/AttachmentsDetails.dart';
import 'package:vocaject_remake_v1/app/Models/LectureDetails.dart';
import 'package:vocaject_remake_v1/app/Models/MahasiswaDetails.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectData.dart';

part 'ProposalData.g.dart';

@JsonSerializable(explicitToJson: true)
class ProposalData {
  final int? id;
  final String? note;
  final String? status;
  final ProjectData project;
  final LectureDetails lecture;
  final List<MahasiswaDetails> members;
  final List<AttachmentsDetails> attachments;

  ProposalData({
    required this.id,
    required this.note,
    required this.status,
    required this.project,
    required this.lecture,
    required this.members,
    required this.attachments,
  });
  factory ProposalData.fromJson(Map<String, dynamic> json) =>
      _$ProposalDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProposalDataToJson(this);
}
