part of 'image_cubit.dart';

@freezed
class ImageState with _$ImageState {
  const factory ImageState.loading() = ImageState_Loading;

  const factory ImageState.ready({
    required Color background,
    required Image image,
    required String url,
  }) = ImageState_Ready;
}
