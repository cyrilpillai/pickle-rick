import 'package:json_annotation/json_annotation.dart';

import 'location_model.dart';
import 'origin_model.dart';

part 'character_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String url;
  @JsonKey(name: 'image')
  final String imageUrl;
  @JsonKey(name: 'episode')
  final List<String> episodes;
  @JsonKey(name: 'origin')
  final OriginModel originModel;
  @JsonKey(name: 'location')
  final LocationModel locationModel;

  CharacterModel(
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.url,
    this.imageUrl,
    this.episodes,
    this.originModel,
    this.locationModel,
  );

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}
