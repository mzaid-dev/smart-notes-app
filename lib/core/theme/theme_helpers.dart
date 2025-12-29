import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_notes_app/core/theme/app_colors.dart';

extension ThemeHelper on BuildContext{
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}