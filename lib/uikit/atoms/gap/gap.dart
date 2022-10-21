import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/sizes.dart';

enum GapType {
  horizontal,
  vertical,
}

class Gap {
  final GapType type;

  late final double? height;
  late final double? width;

  Gap({
    Key? key,
    required this.type,
    this.width,
    this.height,
  });

  static SizedBox horizontalValue(double value) => SizedBox(height: value);

  static SizedBox verticalValue(double value) => SizedBox(width: value);

  static Gap horizontal = Gap(type: GapType.horizontal);
  static Gap vertical = Gap(type: GapType.vertical);

  SizedBox small() {
    if (type == GapType.horizontal) {
      return SizedBox(height: Sizes.small.w);
    } else {
      return SizedBox(width: Sizes.small.h);
    }
  }

  SizedBox regular() {
    if (type == GapType.horizontal) {
      return SizedBox(height: Sizes.regural.w);
    } else {
      return SizedBox(width: Sizes.regural.h);
    }
  }

  SizedBox medium() {
    if (type == GapType.horizontal) {
      return SizedBox(height: Sizes.medium.w);
    } else {
      return SizedBox(width: Sizes.medium.h);
    }
  }

  SizedBox large() {
    if (type == GapType.horizontal) {
      return SizedBox(height: Sizes.large.w);
    } else {
      return SizedBox(width: Sizes.large.h);
    }
  }

  SizedBox big() {
    if (type == GapType.horizontal) {
      return SizedBox(height: Sizes.big.w);
    } else {
      return SizedBox(width: Sizes.big.h);
    }
  }
}
