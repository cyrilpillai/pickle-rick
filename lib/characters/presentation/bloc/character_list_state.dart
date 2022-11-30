import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../models/character_item.dart';

@immutable
abstract class CharacterListState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends CharacterListState {}

class Loading extends CharacterListState {}

class Success extends CharacterListState {
  final List<CharacterItem> characters;

  Success({required this.characters});
}

class Error extends CharacterListState {
  final String message;

  Error({required this.message});
}
