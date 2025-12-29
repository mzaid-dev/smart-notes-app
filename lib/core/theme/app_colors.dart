import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors>{
  final Color scaffoldBg;
  final Color dateText;

  AppColors({
    required this.scaffoldBg,
    required this.dateText
});

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if(other is! AppColors) return this;
    return AppColors(
     scaffoldBg : Color.lerp(scaffoldBg, other.scaffoldBg, t)!,
      dateText : Color.lerp(dateText, other.dateText, t)!,
    );

  }

  @override
  AppColors copyWith() => this;
}