import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppGradient {
  static const gradientSplash = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.greenTop,
      AppColors.greenBottom,
    ],
  );

  static const gradientButton = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.greenTop,
      AppColors.greenBottom,
    ],
  );
}
