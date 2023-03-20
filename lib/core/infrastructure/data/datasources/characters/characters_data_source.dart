import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

import '/core/domain/usecases/usecase.dart';
import '/core/infrastructure/data/datasources/characters/characters_const.dart';
import '/core/infrastructure/data/datasources/datasource_base.dart';
import '/core/infrastructure/data/models/characters/data_character_detail_dto.dart';
import '/core/infrastructure/data/models/characters/data_characters_dto.dart';
import '/core/shared/constants/constants.dart';

abstract class CharactersDataSource {
  /// A function that returns a Future of type [DataCharactersDTO].
  Future<DataCharactersDTO> getCharacters();

  /// A function that returns a Future of type [DataCharacterDetailDTO].
  Future<DataCharacterDetailDTO> getComicsByCharacter(
    DetailCharacterParams params,
  );

  /// A function that returns a Future of type [DataCharacterDetailDTO].
  Future<DataCharacterDetailDTO> getEventsByCharacter(
    DetailCharacterParams params,
  );

  /// A function that returns a Future of type [DataCharacterDetailDTO].
  Future<DataCharacterDetailDTO> getSeriesByCharacter(
    DetailCharacterParams params,
  );

  /// A function that returns a Future of type [DataCharacterDetailDTO].
  Future<DataCharacterDetailDTO> getStoriesByCharacter(
    DetailCharacterParams params,
  );
}

class CharactersDataSourceImpl implements CharactersDataSource {
  /// Constructor
  CharactersDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<DataCharactersDTO> getCharacters() {
    return DataSourceBase<DataCharactersDTO>().serverRequest(() async {
      final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
      final bytesToHash = utf8.encode(
        timeStamp + Constants.privateKey + Constants.publicKey,
      );
      final queryParameters = <String, dynamic>{
        'apikey': Constants.publicKey,
        'hash': md5.convert(bytesToHash).toString(),
        'ts': timeStamp,
      };

      final requestUri = Uri.https(
        Constants.apiGatewayBaseUrl,
        CharactersConst.charactersEndPoint.value,
        queryParameters,
      );

      final response = await _dio.getUri(requestUri);

      return DataCharactersDTO.fromJson(
        response.data['data'] as Map<String, dynamic>,
      );
    });
  }

  @override
  Future<DataCharacterDetailDTO> getComicsByCharacter(
    DetailCharacterParams params,
  ) {
    return DataSourceBase<DataCharacterDetailDTO>().serverRequest(() async {
      final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
      final bytesToHash = utf8.encode(
        timeStamp + Constants.privateKey + Constants.publicKey,
      );
      final queryParameters = <String, dynamic>{
        'apikey': Constants.publicKey,
        'hash': md5.convert(bytesToHash).toString(),
        'ts': timeStamp,
      };

      final requestUri = Uri.https(
        Constants.apiGatewayBaseUrl,
        "${CharactersConst.charactersEndPoint.value}/${params.characterId}/comics",
        queryParameters,
      );

      final response = await _dio.getUri(requestUri);

      return DataCharacterDetailDTO.fromJson(
        response.data['data'] as Map<String, dynamic>,
      );
    });
  }

  @override
  Future<DataCharacterDetailDTO> getEventsByCharacter(
    DetailCharacterParams params,
  ) {
    return DataSourceBase<DataCharacterDetailDTO>().serverRequest(() async {
      final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
      final bytesToHash = utf8.encode(
        timeStamp + Constants.privateKey + Constants.publicKey,
      );
      final queryParameters = <String, dynamic>{
        'apikey': Constants.publicKey,
        'hash': md5.convert(bytesToHash).toString(),
        'ts': timeStamp,
      };

      final requestUri = Uri.https(
        Constants.apiGatewayBaseUrl,
        "${CharactersConst.charactersEndPoint.value}/${params.characterId}/events",
        queryParameters,
      );

      final response = await _dio.getUri(requestUri);

      return DataCharacterDetailDTO.fromJson(
        response.data['data'] as Map<String, dynamic>,
      );
    });
  }

  @override
  Future<DataCharacterDetailDTO> getSeriesByCharacter(
    DetailCharacterParams params,
  ) {
    return DataSourceBase<DataCharacterDetailDTO>().serverRequest(() async {
      final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
      final bytesToHash = utf8.encode(
        timeStamp + Constants.privateKey + Constants.publicKey,
      );
      final queryParameters = <String, dynamic>{
        'apikey': Constants.publicKey,
        'hash': md5.convert(bytesToHash).toString(),
        'ts': timeStamp,
      };

      final requestUri = Uri.https(
        Constants.apiGatewayBaseUrl,
        "${CharactersConst.charactersEndPoint.value}/${params.characterId}/series",
        queryParameters,
      );

      final response = await _dio.getUri(requestUri);

      return DataCharacterDetailDTO.fromJson(
        response.data['data'] as Map<String, dynamic>,
      );
    });
  }

  @override
  Future<DataCharacterDetailDTO> getStoriesByCharacter(
    DetailCharacterParams params,
  ) {
    return DataSourceBase<DataCharacterDetailDTO>().serverRequest(() async {
      final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
      final bytesToHash = utf8.encode(
        timeStamp + Constants.privateKey + Constants.publicKey,
      );
      final queryParameters = <String, dynamic>{
        'apikey': Constants.publicKey,
        'hash': md5.convert(bytesToHash).toString(),
        'ts': timeStamp,
      };

      final requestUri = Uri.https(
        Constants.apiGatewayBaseUrl,
        "${CharactersConst.charactersEndPoint.value}/${params.characterId}/stories",
        queryParameters,
      );

      final response = await _dio.getUri(requestUri);

      return DataCharacterDetailDTO.fromJson(
        response.data['data'] as Map<String, dynamic>,
      );
    });
  }
}
