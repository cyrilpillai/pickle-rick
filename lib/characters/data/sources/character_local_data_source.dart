import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/character_model.dart';

const charactersCache = 'characters_cache';

@injectable
class CharacterLocalDataSource {
  final SharedPreferences _sharedPreferences;

  CharacterLocalDataSource(this._sharedPreferences);

  Future<List<CharacterModel>> fetchCharacters() async {
    final jsonString = _sharedPreferences.getString(charactersCache);
    if (jsonString != null) {
      return Future.value((jsonDecode(jsonString) as List)
          .map((e) => CharacterModel.fromJson(e))
          .toList());
    } else {
      throw Exception('Cache miss');
    }
  }

  saveCharacters(List<CharacterModel> characters) async {
    final list = characters.map((e) => e.toJson()).toList();
    _sharedPreferences.setString(charactersCache, jsonEncode(list));
  }
}
