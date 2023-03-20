import 'package:dartz/dartz.dart';

import '/core/domain/entities/data_character_detail_entity.dart';
import '/core/domain/failures/common_failure.dart';
import '/core/domain/repositories/characters_repository.dart';
import '/core/domain/usecases/usecase.dart';

/// This use case allows us to obtain comics by character
class GetComicsByCharacterUseCase extends UseCaseParams<CommonFailure,
    DataCharacterDetailEntity, DetailCharacterParams> {
  /// Constructor
  GetComicsByCharacterUseCase(
    this._charactersRepository,
  );

  /// The [CharactersRepository] allows us to
  /// request the data characters from the data source
  final CharactersRepository _charactersRepository;

  /// Execution
  @override
  Future<Either<CommonFailure, DataCharacterDetailEntity>> execute(
    DetailCharacterParams params,
  ) async {
    return _charactersRepository.getComicsByCharacter(params);
  }
}
