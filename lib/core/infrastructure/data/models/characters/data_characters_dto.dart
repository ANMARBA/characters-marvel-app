import 'package:freezed_annotation/freezed_annotation.dart';

import '/core/infrastructure/data/models/characters/character_dto.dart';

part 'data_characters_dto.freezed.dart';
part 'data_characters_dto.g.dart';

/// Represents a DataCharactersDTO
@freezed
class DataCharactersDTO with _$DataCharactersDTO {
  /// Empty constructor
  const DataCharactersDTO._();

  /// Named constructor with the properties returned
  const factory DataCharactersDTO({
    required int count,
    required int limit,
    required int offset,
    required int total,
    required List<CharacterDTO> results,
  }) = _DataCharactersDTO;

  /// Connect the generated [_$DataCharactersDTOFromJson]
  /// function to the `fromJson` factory.
  factory DataCharactersDTO.fromJson(Map<String, dynamic> json) =>
      _$DataCharactersDTOFromJson(json);
}
