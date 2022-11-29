import 'package:json_annotation/json_annotation.dart';

part 'origin_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class OriginDTO {
  final String name;
  final String url;

  const OriginDTO(
    this.name,
    this.url,
  );

  factory OriginDTO.fromJson(Map<String, dynamic> json) =>
      _$OriginDTOFromJson(json);

  Map<String, dynamic> toJson() => _$OriginDTOToJson(this);
}
