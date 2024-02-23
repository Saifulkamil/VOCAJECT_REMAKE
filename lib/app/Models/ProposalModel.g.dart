// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProposalModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposalModel _$ProposalModelFromJson(Map<String, dynamic> json) =>
    ProposalModel(
      message: json['message'] as String?,
      data: ProposalData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProposalModelToJson(ProposalModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.toJson(),
    };
