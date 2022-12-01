import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/character_usecase.dart';
import '../models/character_item.dart';
import 'character_list_event.dart';
import 'character_list_state.dart';

@injectable
class CharacterListBloc extends Bloc<CharacterListEvent, CharacterListState> {
  final CharacterUseCase _characterUseCase;

  CharacterListBloc(this._characterUseCase) : super(Empty()) {
    on<Initial>((event, emit) => _fetchCharacters(
          event,
          emit,
        ));
    on<RefreshClicked>((event, emit) => _fetchCharacters(
          event,
          emit,
          forceUpdate: true,
        ));
  }

  void _fetchCharacters(
      CharacterListEvent event, Emitter<CharacterListState> emit,
      {bool forceUpdate = false}) async {
    emit(Loading());
    final characters = await _characterUseCase
        .fetchCharacters(forceUpdate)
        .catchError((error) {
      emit(Error(message: error.toString()));
    });

    //API is quick and we want to show the cool loading view, so...
    await Future.delayed(const Duration(seconds: 1));

    final List<CharacterItem> list =
        characters.map((e) => CharacterItem.fromEntity(e)).toList();
    emit(Success(characters: list));
  }
}
