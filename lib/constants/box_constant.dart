import 'package:coffee_spot/constants/color_constant.dart';
import 'package:flutter/material.dart';

class BoxConstant {
  static List<BoxShadow> shadow = [
    BoxShadow(
      offset: const Offset(0, 1),
      blurRadius: 3,
      color: ColorConstant.black.withOpacity(0.12),
    )
  ];
  static BoxDecoration decoration = BoxDecoration(
    color: ColorConstant.white,
    borderRadius: const BorderRadius.all(Radius.circular(100)),
    boxShadow: BoxConstant.shadow,
  );
  static BoxDecoration circle = BoxDecoration(
    shape: BoxShape.circle,
    color: ColorConstant.gray3,
  );
  static BoxDecoration circlePrimary = BoxDecoration(
    color: ColorConstant.primary,
    shape: BoxShape.circle,
  );
}
