import 'package:freezed_annotation/freezed_annotation.dart';

import '/core/domain/entities/character_entity.dart';

part 'data_characters_entity.freezed.dart';

@freezed
class DataCharactersEntity with _$DataCharactersEntity {
  /// Empty constructor
  const DataCharactersEntity._();

  /// Factory Constructor
  const factory DataCharactersEntity({
    required int count,
    required int limit,
    required int offset,
    required int total,
    required List<CharacterEntity> results,
  }) = _DataCharactersEntity;
}
