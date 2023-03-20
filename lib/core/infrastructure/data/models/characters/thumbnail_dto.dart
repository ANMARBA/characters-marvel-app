import 'package:freezed_annotation/freezed_annotation.dart';

part 'thumbnail_dto.freezed.dart';
part 'thumbnail_dto.g.dart';

/// Represents a ThumbnailDTO
@freezed
class ThumbnailDTO with _$ThumbnailDTO {
  /// Empty constructor
  const ThumbnailDTO._();

  /// Named constructor with the properties returned
  const factory ThumbnailDTO({
    required String extension,
    required String path,
  }) = _ThumbnailDTO;

  /// Connect the generated [_$ThumbnailDTOFromJson]
  /// function to the `fromJson` factory.
  factory ThumbnailDTO.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailDTOFromJson(json);
}
