import 'package:freezed_annotation/freezed_annotation.dart';

part 'characters_event.freezed.dart';

@freezed
class CharactersEvent with _$CharactersEvent {
  const CharactersEvent._();

  const factory CharactersEvent.getCharacters() = _GetCharacters;

  const factory CharactersEvent.getComicsByCharacter({
    required int characterId,
  }) = _GetComicsByCharacter;

  const factory CharactersEvent.getEventsByCharacter({
    required int characterId,
  }) = _GetEventsByCharacter;

  const factory CharactersEvent.getSeriesByCharacter({
    required int characterId,
  }) = _GetSeriesByCharacter;

  const factory CharactersEvent.getStoriesByCharacter({
    required int characterId,
  }) = _GetStoriesByCharacter;
}
