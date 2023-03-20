import 'package:freezed_annotation/freezed_annotation.dart';

import '/core/infrastructure/data/models/characters/thumbnail_dto.dart';

part 'character_dto.freezed.dart';
part 'character_dto.g.dart';

/// Represents a CharacterDTO
@freezed
class CharacterDTO with _$CharacterDTO {
  /// Empty constructor
  const CharacterDTO._();

  /// Named constructor with the properties returned
  const factory CharacterDTO({
    required int id,
    required String name,
    required String description,
    required ThumbnailDTO thumbnail,
  }) = _CharacterDTO;

  /// Connect the generated [_$CharacterDTOFromJson]
  /// function to the `fromJson` factory.
  factory CharacterDTO.fromJson(Map<String, dynamic> json) =>
      _$CharacterDTOFromJson(json);
}
