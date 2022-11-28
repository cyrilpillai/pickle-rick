import 'package:pickle_rick/characters/data/models/character_model.dart';

class Character {
  final int id;
  final String name;
  final String status;
  final String gender;
  final String imageUrl;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.gender,
    required this.imageUrl,
  });

  factory Character.fromModel(CharacterModel characterModel) => Character(
        id: characterModel.id,
        name: characterModel.name,
        status: characterModel.status,
        gender: characterModel.gender,
        imageUrl: characterModel.imageUrl,
      );
}
