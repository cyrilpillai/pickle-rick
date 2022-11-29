import 'package:pickle_rick/characters/data/models/character_dto.dart';
import 'package:recase/recase.dart';

class CharacterEntity {
  final int id;
  final String name;
  final String status;
  final String gender;
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
        name: characterModel.name.titleCase,
        status: characterModel.status.sentenceCase,
        gender: characterModel.gender,
        type: characterModel.type,
        imageUrl: characterModel.imageUrl,
      );
}
