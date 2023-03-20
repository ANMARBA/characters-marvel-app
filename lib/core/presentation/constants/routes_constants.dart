import '/core/presentation/routes/router.dart';

/// Class where are centralized all routes
/// Reference [AppRouter]
class RoutesConstants {
  /// Route name for: '/initial'
  static const initial = '/initial';

  /// Route name for: '/character-detail/:character'
  ///
  /// This page that show the information for character: name, description,
  /// series, comincs, stories, and events where has it appeared
  static const characterDetail = '/character-detail/:character';
}
