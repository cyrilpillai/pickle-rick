import 'package:json_annotation/json_annotation.dart';

import 'location_dto.dart';
import 'origin_dto.dart';

part 'character_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class CharacterDTO {
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
  final OriginDTO originModel;
  @JsonKey(name: 'location')
  final LocationDTO locationModel;

  const CharacterDTO(
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

  factory CharacterDTO.fromJson(Map<String, dynamic> json) =>
      _$CharacterDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterDTOToJson(this);
}
