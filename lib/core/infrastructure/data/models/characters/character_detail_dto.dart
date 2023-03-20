import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_detail_dto.freezed.dart';
part 'character_detail_dto.g.dart';

/// Represents a CharacterDetailDTO
@freezed
class CharacterDetailDTO with _$CharacterDetailDTO {
  /// Empty constructor
  const CharacterDetailDTO._();

  /// Named constructor with the properties returned
  const factory CharacterDetailDTO({
    required int id,
    required String title,
  }) = _CharacterDetailDTO;

  /// Connect the generated [_$CharacterDetailDTOFromJson]
  /// function to the `fromJson` factory.
  factory CharacterDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$CharacterDetailDTOFromJson(json);
}
