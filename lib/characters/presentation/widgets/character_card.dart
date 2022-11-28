import 'package:flutter/material.dart';

import '../../domain/entities/character_entity.dart';

class CharacterCard extends StatelessWidget {
  final Character quote;

  const CharacterCard({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  quote.name,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 16)),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  quote.gender,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
