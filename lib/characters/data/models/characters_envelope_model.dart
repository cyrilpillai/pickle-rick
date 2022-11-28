import 'package:json_annotation/json_annotation.dart';

import 'character_model.dart';

part 'characters_envelope_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CharactersEnvelopeModel {
  @JsonKey(name: 'results')
  final List<CharacterModel> characters;

  CharactersEnvelopeModel(this.characters);

  factory CharactersEnvelopeModel.fromJson(Map<String, dynamic> json) =>
      _$CharactersEnvelopeModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersEnvelopeModelToJson(this);
}
