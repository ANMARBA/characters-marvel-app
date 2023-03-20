import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '/core/domain/repositories/characters_repository.dart';
import '/core/domain/usecases/get_characters_use_case.dart';
import '/core/domain/usecases/get_comics_by_character_use_case.dart';
import '/core/domain/usecases/get_events_by_character_use_case.dart';
import '/core/domain/usecases/get_series_by_character_use_case.dart';
import '/core/domain/usecases/get_stories_by_character_use_case.dart';
import '/core/infrastructure/data/datasources/characters/characters_data_source.dart';
import '/core/infrastructure/data/repositories/characters_repository_impl.dart';
import '/core/presentation/routes/router.dart';

final getIt = GetIt.instance;

init() {
  // ---------------------------------------------------------------------
  //                              Router
  // ---------------------------------------------------------------------
  getIt.registerSingleton<AppRouter>(AppRouter());

  // ---------------------------------------------------------------------
  //                              Dio
  // ---------------------------------------------------------------------
  getIt.registerSingleton<Dio>(Dio());

  // ---------------------------------------------------------------------
  //                              Repositories
  // ---------------------------------------------------------------------
  getIt.registerLazySingleton<CharactersRepository>(
      () => CharactersRepositoryImpl(getIt()));

  // ---------------------------------------------------------------------
  //                               Use Cases
  // ---------------------------------------------------------------------
  getIt.registerLazySingleton(() => GetCharactersUseCase(getIt()));
  getIt.registerLazySingleton(() => GetComicsByCharacterUseCase(getIt()));
  getIt.registerLazySingleton(() => GetEventsByCharacterUseCase(getIt()));
  getIt.registerLazySingleton(() => GetSeriesByCharacterUseCase(getIt()));
  getIt.registerLazySingleton(() => GetStoriesByCharacterUseCase(getIt()));

  // ---------------------------------------------------------------------
  //                               DataSource
  // ---------------------------------------------------------------------
  getIt.registerLazySingleton<CharactersDataSource>(
      () => CharactersDataSourceImpl(getIt()));
}
