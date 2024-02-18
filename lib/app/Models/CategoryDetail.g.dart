// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoryDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDetail _$CategoryDetailFromJson(Map<String, dynamic> json) =>
    CategoryDetail(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$CategoryDetailToJson(CategoryDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'role': instance.role,
    };
