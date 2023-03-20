import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_detail_entity.freezed.dart';

@freezed
class CharacterDetailEntity with _$CharacterDetailEntity {
  /// Empty constructor
  const CharacterDetailEntity._();

  /// Factory Constructor
  const factory CharacterDetailEntity({
    required int id,
    required String title,
  }) = _CharacterDetailEntity;
}
