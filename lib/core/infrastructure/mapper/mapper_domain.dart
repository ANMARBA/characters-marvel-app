import '/core/domain/entities/character_detail_entity.dart';
import '/core/domain/entities/character_entity.dart';
import '/core/domain/entities/data_character_detail_entity.dart';
import '/core/domain/entities/data_characters_entity.dart';
import '/core/domain/entities/thumbnail_entity.dart';
import '/core/infrastructure/data/models/characters/character_detail_dto.dart';
import '/core/infrastructure/data/models/characters/character_dto.dart';
import '/core/infrastructure/data/models/characters/data_character_detail_dto.dart';
import '/core/infrastructure/data/models/characters/data_characters_dto.dart';
import '/core/infrastructure/data/models/characters/thumbnail_dto.dart';

/// With this mapper, we can convert a Data Transfer Object to an Entity

extension MapperDataCharactersDTO on DataCharactersDTO {
  /// [DataCharactersDTO] (Infrastructure) to [DataCharactersEntity] (Domain)
  DataCharactersEntity toDomain() => DataCharactersEntity(
      count: count,
      limit: limit,
      offset: offset,
      total: total,
      results: results.map((e) => e.toDomain()).toList());
}

extension MapperCharacterDTO on CharacterDTO {
  /// [CharacterDTO] (Infrastructure)
  /// to [CharacterEntity] (Domain)
  CharacterEntity toDomain() => CharacterEntity(
        id: id,
        name: name,
        description: description,
        thumbnail: thumbnail.toDomain(),
      );
}

extension MapperThumbnailDTO on ThumbnailDTO {
  /// [ThumbnailDTO] (Infrastructure)
  /// to [ThumbnailEntity] (Domain)
  ThumbnailEntity toDomain() => ThumbnailEntity(
        extension: extension,
        path: path,
      );
}

extension MapperDataCharacterDetailDTO on DataCharacterDetailDTO {
  /// [DataCharacterDetailDTO] (Infrastructure) to [DataCharacterDetailEntity] (Domain)
  DataCharacterDetailEntity toDomain() => DataCharacterDetailEntity(
      count: count,
      limit: limit,
      offset: offset,
      total: total,
      results: results.map((e) => e.toDomain()).toList());
}

extension MapperCharacterDetailDTO on CharacterDetailDTO {
  /// [CharacterDetailDTO] (Infrastructure)
  /// to [CharacterDetailEntity] (Domain)
  CharacterDetailEntity toDomain() => CharacterDetailEntity(
        id: id,
        title: title,
      );
}
