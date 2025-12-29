import 'package:flutter/material.dart';
import 'package:smart_notes_app/core/theme/app_colors.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  extensions: [
    AppColors(scaffoldBg: Colors.black, dateText: Colors.white)
  ]
);