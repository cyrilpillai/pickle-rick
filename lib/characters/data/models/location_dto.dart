import 'package:json_annotation/json_annotation.dart';

part 'location_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class LocationDTO {
  final String name;
  final String url;

  const LocationDTO(
    this.name,
    this.url,
  );

  factory LocationDTO.fromJson(Map<String, dynamic> json) =>
      _$LocationDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDTOToJson(this);
}
