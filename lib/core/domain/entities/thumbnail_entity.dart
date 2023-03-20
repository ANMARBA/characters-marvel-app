import 'package:freezed_annotation/freezed_annotation.dart';

part 'thumbnail_entity.freezed.dart';

@freezed
class ThumbnailEntity with _$ThumbnailEntity {
  /// Empty constructor
  const ThumbnailEntity._();

  /// Factory Constructor
  const factory ThumbnailEntity({
    required String extension,
    required String path,
  }) = _ThumbnailEntity;
}
