import 'package:freezed_annotation/freezed_annotation.dart';

import '/core/domain/entities/thumbnail_entity.dart';

part 'character_entity.freezed.dart';

@freezed
class CharacterEntity with _$CharacterEntity {
  /// Empty constructor
  const CharacterEntity._();

  /// Factory Constructor
  const factory CharacterEntity({
    required int id,
    required String name,
    required String description,
    required ThumbnailEntity thumbnail,
  }) = _CharacterEntity;

  String get fullPath => "${thumbnail.path}.${thumbnail.extension}";
}
