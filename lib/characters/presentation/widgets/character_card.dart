import 'package:flutter/material.dart';

import '../models/character_item.dart';

class CharacterCard extends StatelessWidget {
  final CharacterItem characterItem;

  const CharacterCard({super.key, required this.characterItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          _buildAvatar(),
          const Padding(padding: EdgeInsets.all(8)),
          _buildDetails(),
          _buildGenderIcon(
            characterItem.genderIcon,
            characterItem.genderColor,
          )
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return SizedBox(
      width: 50,
      height: 50,
      child: CircleAvatar(
        radius: 48,
        backgroundColor: Colors.grey.shade300,
        backgroundImage: NetworkImage(
          characterItem.imageUrl,
        ),
      ),
    );
  }

  Widget _buildDetails() {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        const Padding(padding: EdgeInsets.only(top: 4)),
        _buildDescription(),
        const Padding(padding: EdgeInsets.only(top: 4)),
        _buildLocation(),
      ],
    ));
  }

  Widget _buildTitle() {
    return Text(
      characterItem.title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }

  Widget _buildDescription() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: characterItem.statusColor,
            shape: BoxShape.circle,
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
        Expanded(
          child: Text(
            characterItem.description,
            textAlign: TextAlign.start,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLocation() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.location_on,
          color: Colors.red,
          size: 14,
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
        Expanded(
          child: Text(
            characterItem.location,
            textAlign: TextAlign.start,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderIcon(IconData iconData, Color color) {
    return Icon(iconData, color: color);
  }
}
