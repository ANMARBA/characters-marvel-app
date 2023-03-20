import 'dart:async';

import 'package:dartz/dartz.dart';

import '/core/domain/failures/common_failure.dart';
import '/core/infrastructure/data/repositories/global_exceptions.dart';

/// Class with methods to reuse code in the repository layer
class RepositoryBase<T> {
  /// Generic function that handles exceptions in the repository layer
  /// [execute] is the function that will be executed in which the
  /// handle exceptions
  Future<Either<CommonFailure, T>> remoteRequest(
    FutureOr<Either<CommonFailure, T>> Function() execute,
  ) async {
    try {
      return await execute();
    } on NoInternetConnectionException catch (_) {
      /// returns failure if there was internet connection problem
      return left(const CommonFailure.noConnection());
    } on RestApiException catch (_) {
      /// returns failure caused by server exception
      return left(const CommonFailure.server());
    } catch (_) {
      rethrow;
    }
  }
}
