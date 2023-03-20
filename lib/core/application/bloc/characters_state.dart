import 'package:freezed_annotation/freezed_annotation.dart';

import '/core/domain/entities/data_character_detail_entity.dart';
import '/core/domain/entities/data_characters_entity.dart';
import '/core/domain/failures/common_failure.dart';

part 'characters_state.freezed.dart';

@freezed
class CharactersState with _$CharactersState {
  const CharactersState._();

  const factory CharactersState.initial() = _Initial;

  const factory CharactersState.loading() = _Loading;

  const factory CharactersState.dataCharacters({
    required DataCharactersEntity data,
  }) = _DataCharacters;

  const factory CharactersState.dataComicsByCharacter({
    required DataCharacterDetailEntity data,
  }) = _DataComicsByCharacter;

  const factory CharactersState.dataEventsByCharacter({
    required DataCharacterDetailEntity data,
  }) = _DataEventsByCharacter;

  const factory CharactersState.dataSeriesByCharacter({
    required DataCharacterDetailEntity data,
  }) = _DataSeriesByCharacter;

  const factory CharactersState.dataStoriesByCharacter({
    required DataCharacterDetailEntity data,
  }) = _DataStoriesByCharacter;

  const factory CharactersState.error({required CommonFailure failure}) =
      _Error;
}
