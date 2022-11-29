import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../../domain/entities/character_entity.dart';

class CharacterItem {
  final String title;
  final String description;
  final Color statusColor;
  final IconData genderIcon;
  final Color genderColor;
  final String imageUrl;

  const CharacterItem({
    required this.title,
    required this.description,
    required this.statusColor,
    required this.genderIcon,
    required this.genderColor,
    required this.imageUrl,
  });

  factory CharacterItem.fromEntity(CharacterEntity characterEntity) {
    final description = characterEntity.type.isEmpty
        ? characterEntity.status.name.sentenceCase
        : '${characterEntity.status.name.sentenceCase} - ${characterEntity.type}';

    return CharacterItem(
      title: characterEntity.name,
      description: description,
      statusColor: _getStatusColor(characterEntity.status),
      genderIcon: _getGenderIcon(characterEntity.gender),
      genderColor: _getGenderColor(characterEntity.gender),
      imageUrl: characterEntity.imageUrl,
    );
  }

  static Color _getStatusColor(Status status) {
    switch (status) {
      case Status.alive:
        return Colors.green;
      case Status.dead:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  static IconData _getGenderIcon(Gender gender) {
    switch (gender) {
      case Gender.male:
        return Icons.male;
      case Gender.female:
        return Icons.female;
      case Gender.genderless:
        return Icons.transgender;
      default:
        return Icons.contact_support;
    }
  }

  static Color _getGenderColor(Gender gender) {
    switch (gender) {
      case Gender.male:
        return Colors.blue;
      case Gender.female:
        return Colors.pink;
      case Gender.genderless:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
