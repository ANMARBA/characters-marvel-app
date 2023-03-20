import 'package:dartz/dartz.dart';

import '/core/domain/entities/data_character_detail_entity.dart';
import '/core/domain/entities/data_characters_entity.dart';
import '/core/domain/failures/common_failure.dart';
import '/core/domain/repositories/characters_repository.dart';
import '/core/domain/usecases/usecase.dart';
import '/core/infrastructure/data/datasources/characters/characters_data_source.dart';
import '/core/infrastructure/data/repositories/repository_base.dart';
import '/core/infrastructure/mapper/mapper_domain.dart';

/// This is the implementation of our [CharactersRepository]
class CharactersRepositoryImpl implements CharactersRepository {
  /// Constructor
  const CharactersRepositoryImpl(this._charactersDataSource);

  final CharactersDataSource _charactersDataSource;

  @override
  Future<Either<CommonFailure, DataCharactersEntity>> getCharacters() async {
    return RepositoryBase<DataCharactersEntity>().remoteRequest(() async {
      final result = await _charactersDataSource.getCharacters();
      return right(result.toDomain());
    });
  }

  @override
  Future<Either<CommonFailure, DataCharacterDetailEntity>> getComicsByCharacter(
    DetailCharacterParams params,
  ) async {
    return RepositoryBase<DataCharacterDetailEntity>().remoteRequest(() async {
      final result = await _charactersDataSource.getComicsByCharacter(params);
      return right(result.toDomain());
    });
  }

  @override
  Future<Either<CommonFailure, DataCharacterDetailEntity>> getEventsByCharacter(
    DetailCharacterParams params,
  ) async {
    return RepositoryBase<DataCharacterDetailEntity>().remoteRequest(() async {
      final result = await _charactersDataSource.getEventsByCharacter(params);
      return right(result.toDomain());
    });
  }

  @override
  Future<Either<CommonFailure, DataCharacterDetailEntity>> getSeriesByCharacter(
    DetailCharacterParams params,
  ) async {
    return RepositoryBase<DataCharacterDetailEntity>().remoteRequest(() async {
      final result = await _charactersDataSource.getSeriesByCharacter(params);
      return right(result.toDomain());
    });
  }

  @override
  Future<Either<CommonFailure, DataCharacterDetailEntity>>
      getStoriesByCharacter(
    DetailCharacterParams params,
  ) async {
    return RepositoryBase<DataCharacterDetailEntity>().remoteRequest(() async {
      final result = await _charactersDataSource.getStoriesByCharacter(params);
      return right(result.toDomain());
    });
  }
}
