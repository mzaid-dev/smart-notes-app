import 'package:flutter/material.dart';

import 'app_colors.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
    extensions: [
      AppColors(scaffoldBg: Colors.white, dateText: Colors.black)
    ]
);