import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/character_entity.dart';

@immutable
abstract class CharacterListState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends CharacterListState {}

class Loading extends CharacterListState {}

class Success extends CharacterListState {
  final List<Character> characters;

  Success({required this.characters});
}

class Error extends CharacterListState {
  final String message;

  Error({required this.message});
}
