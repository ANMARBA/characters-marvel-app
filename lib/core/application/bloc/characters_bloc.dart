import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/application/bloc/characters.dart';
import '/core/domain/usecases/get_characters_use_case.dart';
import '/core/domain/usecases/get_comics_by_character_use_case.dart';
import '/core/domain/usecases/get_events_by_character_use_case.dart';
import '/core/domain/usecases/get_series_by_character_use_case.dart';
import '/core/domain/usecases/get_stories_by_character_use_case.dart';
import '/core/domain/usecases/usecase.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final GetCharactersUseCase getCharactersUseCase;
  final GetComicsByCharacterUseCase getComicsByCharacterUseCase;
  final GetEventsByCharacterUseCase getEventsByCharacterUseCase;
  final GetStoriesByCharacterUseCase getStoriesByCharacterUseCase;
  final GetSeriesByCharacterUseCase getSeriesByCharacterUseCase;

  CharactersBloc({
    required this.getCharactersUseCase,
    required this.getComicsByCharacterUseCase,
    required this.getEventsByCharacterUseCase,
    required this.getStoriesByCharacterUseCase,
    required this.getSeriesByCharacterUseCase,
  }) : super(const CharactersState.initial()) {
    on<CharactersEvent>((event, emit) async {
      await event.when(
        getCharacters: () async {
          emit(const CharactersState.loading());

          final result = await getCharactersUseCase.execute();

          emit(
            result.fold(
              (l) => CharactersState.error(failure: l),
              (r) => CharactersState.dataCharacters(data: r),
            ),
          );
        },
        getComicsByCharacter: (characterId) async {
          final result = await getComicsByCharacterUseCase.execute(
            DetailCharacterParams(characterId),
          );

          emit(
            result.fold(
              (l) => CharactersState.error(failure: l),
              (r) => CharactersState.dataComicsByCharacter(data: r),
            ),
          );
        },
        getEventsByCharacter: (characterId) async {
          final result = await getEventsByCharacterUseCase.execute(
            DetailCharacterParams(characterId),
          );

          emit(
            result.fold(
              (l) => CharactersState.error(failure: l),
              (r) => CharactersState.dataEventsByCharacter(data: r),
            ),
          );
        },
        getSeriesByCharacter: (characterId) async {
          final result = await getSeriesByCharacterUseCase.execute(
            DetailCharacterParams(characterId),
          );

          emit(
            result.fold(
              (l) => CharactersState.error(failure: l),
              (r) => CharactersState.dataSeriesByCharacter(data: r),
            ),
          );
        },
        getStoriesByCharacter: (characterId) async {
          final result = await getStoriesByCharacterUseCase.execute(
            DetailCharacterParams(characterId),
          );

          emit(
            result.fold(
              (l) => CharactersState.error(failure: l),
              (r) => CharactersState.dataStoriesByCharacter(data: r),
            ),
          );
        },
      );
    });
  }
}
