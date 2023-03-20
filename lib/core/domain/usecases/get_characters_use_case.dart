import 'package:dartz/dartz.dart';

import '/core/domain/entities/data_characters_entity.dart';
import '/core/domain/failures/common_failure.dart';
import '/core/domain/repositories/characters_repository.dart';
import '/core/domain/usecases/usecase.dart';

/// This use case allows us to obtain the characters
/// from the marvel universe
class GetCharactersUseCase
    extends UseCase<CommonFailure, DataCharactersEntity> {
  /// Constructor
  GetCharactersUseCase(
    this._charactersRepository,
  );

  /// The [CharactersRepository] allows us to
  /// request the data characters from the data source
  final CharactersRepository _charactersRepository;

  /// Execution
  @override
  Future<Either<CommonFailure, DataCharactersEntity>> execute() async {
    return _charactersRepository.getCharacters();
  }
}
