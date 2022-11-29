import 'package:pickle_rick/characters/data/models/character_dto.dart';

class CharacterEntity {
  final int id;
  final String name;
  final Status status;
  final Gender gender;
  final String type;
  final String imageUrl;

  const CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.gender,
    required this.type,
    required this.imageUrl,
  });

  factory CharacterEntity.fromModel(CharacterDTO characterModel) =>
      CharacterEntity(
        id: characterModel.id,
        name: characterModel.name,
        status: characterModel.status._toStatus(),
        gender: characterModel.gender._toGender(),
        type: characterModel.type,
        imageUrl: characterModel.imageUrl,
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
