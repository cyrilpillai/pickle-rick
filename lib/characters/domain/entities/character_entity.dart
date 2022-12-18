import 'package:pickle_rick/characters/data/models/character_dto.dart';

class CharacterEntity {
  final int id;
  final String name;
  final Status status;
  final Gender gender;
  final String type;
  final String imageUrl;
  final String location;

  const CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.gender,
    required this.type,
    required this.imageUrl,
    required this.location,
  });

  factory CharacterEntity.fromModel(CharacterDTO characterDTO) =>
      CharacterEntity(
        id: characterDTO.id,
        name: characterDTO.name,
        status: characterDTO.status._toStatus(),
        gender: characterDTO.gender._toGender(),
        type: characterDTO.type,
        imageUrl: characterDTO.imageUrl,
        location: characterDTO.locationModel.name,
      );
}

enum Status { alive, dead, unknown }

enum Gender { male, female, genderless, unknown }

extension CharacterEnums on String {
  Status _toStatus() {
    switch (toLowerCase()) {
      case 'alive':
        return Status.alive;
      case 'dead':
        return Status.alive;
      default:
        return Status.unknown;
    }
  }

  Gender _toGender() {
    switch (toLowerCase()) {
      case 'male':
        return Gender.male;
      case 'female':
        return Gender.female;
      case 'genderless':
        return Gender.genderless;
      default:
        return Gender.unknown;
    }
  }
}
