import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class CharacterListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Initial extends CharacterListEvent {}

class RefreshClicked extends CharacterListEvent {}
