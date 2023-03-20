import 'package:freezed_annotation/freezed_annotation.dart';

import '/core/domain/entities/character_detail_entity.dart';

part 'data_character_detail_entity.freezed.dart';

@freezed
class DataCharacterDetailEntity with _$DataCharacterDetailEntity {
  /// Empty constructor
  const DataCharacterDetailEntity._();

  /// Factory Constructor
  const factory DataCharacterDetailEntity({
    required int count,
    required int limit,
    required int offset,
    required int total,
    required List<CharacterDetailEntity> results,
  }) = _DataCharacterDetailEntity;
}
