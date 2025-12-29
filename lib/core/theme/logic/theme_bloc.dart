import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(ThemeMode.light)) {
    on<ToggleThemeEvent>((event, emit) {
      final isLight = state.themeMode == ThemeMode.light;
      emit(ThemeState(isLight ? ThemeMode.dark : ThemeMode.light));
    });
  }
}