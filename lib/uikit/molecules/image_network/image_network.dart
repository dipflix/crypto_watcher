import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:crypto_watcher/uikit/uikit.dart';

class ImageNetwork extends CachedNetworkImage {
  final void Function(ImageProvider imageProvider)? onReady;

  ImageNetwork(
    String path, {
    super.key,
    BoxFit? fit,
    double? width,
    double? height,
    AlignmentGeometry alignment = Alignment.center,
    this.onReady,
  }) : super(
          imageUrl: path,
          fadeInDuration: const Duration(milliseconds: 150),
          fadeOutDuration: const Duration(milliseconds: 150),
          imageBuilder: (context, _imageProvider) {
            var image = Image(
              image: _imageProvider,
              fit: fit,
              width: width,
              height: height,
              alignment: alignment,
            );

            onReady?.call(_imageProvider);

            return Hero(tag: path, child: image);
          },
          errorWidget: (context, url, error) => DecoratedBox(
            decoration: BoxDecoration(
              color: Palette.errorRed.withAlpha(50),
            ),
            child: Center(
              child: Icon(
                Icons.error_outline,
                color: Palette.errorRed,
              ),
            ),
          ),
        );
}
