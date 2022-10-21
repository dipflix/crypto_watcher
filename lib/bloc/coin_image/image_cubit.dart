import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:crypto_watcher/uikit/uikit.dart';

part 'image_state.dart';

part 'image_cubit.freezed.dart';

class ImageCubit extends Cubit<ImageState> {
  final String url;

  ImageCubit(this.url) : super(ImageState.loading());

  void process() {
    final image = Image.network(url);

    PaletteGenerator.fromImageProvider(
      image.image,
      size: Size(48, 48),
    ).then((value) {
      if (value.dominantColor != null) {
        emit(
          ImageState.ready(
            background: value.dominantColor!.color,
            image: image,
            url: url,
          ),
        );
      } else {
        emit(
          ImageState.ready(
              background: Palette.overlay2, image: image, url: url),
        );
      }
    });
  }
}
