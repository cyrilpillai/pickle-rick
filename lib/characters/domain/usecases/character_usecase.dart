import 'package:injectable/injectable.dart';

import '../../data/repositories/character_repository.dart';
import '../entities/character_entity.dart';

@injectable
class CharacterUseCase {
  final CharacterRepository _charactersRepository;

  CharacterUseCase(this._charactersRepository);

  Future<List<CharacterEntity>> fetchCharacters(bool forceUpdate) async {
    return (await _charactersRepository.fetchCharacters(forceUpdate))
        .map((e) => CharacterEntity.fromModel(e))
        .toList();
  }
}
