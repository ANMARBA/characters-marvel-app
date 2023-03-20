import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import '/core/presentation/constants/routes_constants.dart';
import '/core/presentation/routes/pages.dart';
part 'router.gr.dart';

/// Annotate on the router class which accepts a list of routes as an argument
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomePage,
      initial: true,
      path: RoutesConstants.initial,
    ),
    AutoRoute(
      page: CharacterDetailPage,
      path: RoutesConstants.characterDetail,
    ),
  ],
)

// extend the generated private router
class AppRouter extends _$AppRouter {}
