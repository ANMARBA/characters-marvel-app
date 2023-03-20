import 'package:dartz/dartz.dart';

import '/core/domain/entities/data_character_detail_entity.dart';
import '/core/domain/entities/data_characters_entity.dart';
import '/core/domain/failures/common_failure.dart';
import '/core/domain/usecases/usecase.dart';

/// Characters Repository
abstract class CharactersRepository {
  /// A function that returns a Future of Either of [CommonFailure] or [DataCharactersEntity].
  Future<Either<CommonFailure, DataCharactersEntity>> getCharacters();

  /// A function that returns a Future of Either of [CommonFailure] or [DataCharacterDetailEntity].
  Future<Either<CommonFailure, DataCharacterDetailEntity>> getComicsByCharacter(
    DetailCharacterParams params,
  );

  /// A function that returns a Future of Either of [CommonFailure] or [DataCharacterDetailEntity].
  Future<Either<CommonFailure, DataCharacterDetailEntity>> getEventsByCharacter(
    DetailCharacterParams params,
  );

  /// A function that returns a Future of Either of [CommonFailure] or [DataCharacterDetailEntity].
  Future<Either<CommonFailure, DataCharacterDetailEntity>> getSeriesByCharacter(
    DetailCharacterParams params,
  );

  /// A function that returns a Future of Either of [CommonFailure] or [DataCharacterDetailEntity].
  Future<Either<CommonFailure, DataCharacterDetailEntity>>
      getStoriesByCharacter(
    DetailCharacterParams params,
  );
}
