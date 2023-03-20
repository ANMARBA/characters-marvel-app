import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_failure.freezed.dart';

/// Different kind of failures that will be handled
@freezed
class CommonFailure with _$CommonFailure {
  const CommonFailure._();

  /// When something went wrong because of the data that has been sent
  const factory CommonFailure.data({String? message}) = _Data;

  /// When there is no data in the response
  const factory CommonFailure.noData({String? message}) = _NoData;

  /// When something went wrong in the server side
  const factory CommonFailure.server({
    String? message,
    int? code,
  }) = _Server;

  /// When there is not internet connection
  const factory CommonFailure.noConnection({String? message}) = _NoConnection;

  /// When an error occurs due to a specific business exception of a flow
  const factory CommonFailure.other({
    String? message,
    int? code,
  }) = _Other;
}
