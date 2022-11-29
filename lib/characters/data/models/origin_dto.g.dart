// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'origin_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OriginDTO _$OriginDTOFromJson(Map<String, dynamic> json) {
  return OriginDTO(
    json['name'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$OriginDTOToJson(OriginDTO instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
