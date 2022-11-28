import 'dart:developer';

import 'package:injectable/injectable.dart';

import '../models/character_model.dart';
import '../models/characters_envelope_model.dart';
import '../sources/character_local_data_source.dart';
import '../sources/character_remote_data_source.dart';

@injectable
class CharacterRepository {
  final CharacterLocalDataSource _localDataSource;
  final CharacterRemoteDataSource _remoteDataSource;

  CharacterRepository(this._localDataSource, this._remoteDataSource);

  Future<List<CharacterModel>> fetchCharacters(bool forceUpdate) async {
    try {
      if (!forceUpdate) {
        return await _localDataSource.fetchCharacters();
      } else {
        return _fetchCharactersRemote();
      }
    } catch (error) {
      return _fetchCharactersRemote();
    }
  }

  Future<List<CharacterModel>> _fetchCharactersRemote() async {
    try {
      final response = await _remoteDataSource.fetchCharacters();
      if (response.statusCode == 200) {
        log(response.data.toString());
        final characters = CharactersEnvelopeModel.fromJson(response.data).characters;
        _localDataSource.saveCharacters(characters);
        return characters;
      } else {
        throw Exception("Server error");
      }
    } catch (error) {
      rethrow;
    }
  }
}