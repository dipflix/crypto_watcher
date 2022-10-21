import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:crypto_watcher/bloc/bloc.dart';
import 'package:crypto_watcher/uikit/uikit.dart';

class CoinImage extends StatelessWidget {
  final double dimension;

  const CoinImage({
    Key? key,
    required this.dimension,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        return state.when(loading: () {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: Palette.overlay2,
            ),
            child: SizedBox.square(dimension: dimension),
          );
        }, ready: (color, image, url) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: color.withOpacity(0.25),
            ),
            child: SizedBox.square(
              dimension: dimension,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(dimension / 4),
                    child: ImageNetwork(url),
                  ),
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
