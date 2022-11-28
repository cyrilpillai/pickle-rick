// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_envelope_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersEnvelopeModel _$CharactersEnvelopeModelFromJson(
    Map<String, dynamic> json) {
  return CharactersEnvelopeModel(
    (json['results'] as List<dynamic>)
        .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CharactersEnvelopeModelToJson(
        CharactersEnvelopeModel instance) =>
    <String, dynamic>{
      'results': instance.characters.map((e) => e.toJson()).toList(),
    };
