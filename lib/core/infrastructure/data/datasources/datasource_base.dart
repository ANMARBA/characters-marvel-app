import 'dart:io';

import 'package:dio/dio.dart';

import 'package:marvel_app/core/infrastructure/data/repositories/global_exceptions.dart';
import 'package:marvel_app/core/shared/constants/constants.dart';

extension DioErrorX on DioError {
  /// Check if there is internet connection
  bool get isNoConnectionError {
    return type == DioErrorType.other && error is SocketException;
  }
}

class DataSourceBase<T> {
  /// Generic method that handles common exceptions when making a request
  /// even server [T] type of data to return in the request
  /// [execute] the function that will perform the request
  Future<T> serverRequest(
    Future<T> Function() execute, {
    String noInternetMessage = Constants.errorNetwork,
    String errorDefaultMessage = Constants.errorConnecting,
  }) async {
    try {
      return await execute.call();
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        /// Throws exception caused by internet connection problem
        throw NoInternetConnectionException(message: noInternetMessage);
      } else {
        /// Throws Exception when something went wrong in the call
        throw RestApiException();
      }
    } catch (e) {
      rethrow;
    }
  }
}
