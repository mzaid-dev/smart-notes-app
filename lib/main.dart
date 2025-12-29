import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_notes_app/core/theme/logic/theme_bloc.dart';
import 'package:smart_notes_app/core/theme/logic/theme_event.dart';
import 'package:smart_notes_app/core/theme/logic/theme_state.dart';
import 'package:smart_notes_app/features/auth/ui/widgets/bg_wrapper.dart';
import 'package:smart_notes_app/test1.dart';
import 'package:smart_notes_app/test3.dart';

import '2.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_helpers.dart';
import 'test.dart';

void main() {
  runApp(BlocProvider(create: (create) => ThemeBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          themeMode: state.themeMode,
          home: BgWrapper(),
        );
      },
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.scaffoldBg,
      body: Center(
        child: ElevatedButton(onPressed: (){
          context.read<ThemeBloc>().add(ToggleThemeEvent());
        }, child: const Text("Toggle Theme")),
      ),
    );
  }
}
