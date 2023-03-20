import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/application/bloc/characters.dart';
import '/core/domain/usecases/get_characters_use_case.dart';
import '/core/domain/usecases/get_comics_by_character_use_case.dart';
import '/core/domain/usecases/get_events_by_character_use_case.dart';
import '/core/domain/usecases/get_series_by_character_use_case.dart';
import '/core/domain/usecases/get_stories_by_character_use_case.dart';
import '/core/presentation/routes/router.dart';
import '/core/shared/di/injection_container.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// app router instance
  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharactersBloc>(
      lazy: false,
      create: (_) {
        return CharactersBloc(
          getCharactersUseCase: getIt<GetCharactersUseCase>(),
          getComicsByCharacterUseCase: getIt<GetComicsByCharacterUseCase>(),
          getEventsByCharacterUseCase: getIt<GetEventsByCharacterUseCase>(),
          getSeriesByCharacterUseCase: getIt<GetSeriesByCharacterUseCase>(),
          getStoriesByCharacterUseCase: getIt<GetStoriesByCharacterUseCase>(),
        )..add(const CharactersEvent.getCharacters());
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
