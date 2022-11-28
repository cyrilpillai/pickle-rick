// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) {
  return CharacterModel(
    json['id'] as int,
    json['name'] as String,
    json['status'] as String,
    json['species'] as String,
    json['type'] as String,
    json['gender'] as String,
    json['url'] as String,
    json['image'] as String,
    (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
    OriginModel.fromJson(json['origin'] as Map<String, dynamic>),
    LocationModel.fromJson(json['location'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'url': instance.url,
      'image': instance.imageUrl,
      'episode': instance.episodes,
      'origin': instance.originModel.toJson(),
      'location': instance.locationModel.toJson(),
    };
