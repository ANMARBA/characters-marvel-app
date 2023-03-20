import 'package:freezed_annotation/freezed_annotation.dart';

import '/core/infrastructure/data/models/characters/character_detail_dto.dart';

part 'data_character_detail_dto.freezed.dart';
part 'data_character_detail_dto.g.dart';

/// Represents a DataCharacterDetailDTO
@freezed
class DataCharacterDetailDTO with _$DataCharacterDetailDTO {
  /// Empty constructor
  const DataCharacterDetailDTO._();

  /// Named constructor with the properties returned
  const factory DataCharacterDetailDTO({
    required int count,
    required int limit,
    required int offset,
    required int total,
    required List<CharacterDetailDTO> results,
  }) = _DataCharacterDetailDTO;

  /// Connect the generated [_$DataCharacterDetailDTOFromJson]
  /// function to the `fromJson` factory.
  factory DataCharacterDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$DataCharacterDetailDTOFromJson(json);
}
