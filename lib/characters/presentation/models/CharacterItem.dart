import 'package:flutter/material.dart';

import '../../domain/entities/character_entity.dart';

class CharacterItem {
  final String title;
  final String description;
  final String status;
  final Color statusColor;
  final String imageUrl;

  const CharacterItem({
    required this.title,
    required this.description,
    required this.status,
    required this.statusColor,
    required this.imageUrl,
  });

  factory CharacterItem.fromEntity(CharacterEntity characterEntity) {
    final description = characterEntity.type.isEmpty
        ? characterEntity.status
        : '${characterEntity.status} - ${characterEntity.type}';

    return CharacterItem(
      title: characterEntity.name,
      description: description,
      status: characterEntity.status,
      statusColor: _getStatusColor(characterEntity.status),
      imageUrl: characterEntity.imageUrl,
    );
  }

  static Color _getStatusColor(String status) {
    switch (status) {
      case 'Alive':
        return Colors.green;
      case 'Dead':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
