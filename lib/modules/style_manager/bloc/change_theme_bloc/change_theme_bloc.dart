import 'dart:async';

import 'package:chat_app/main.dart';
import 'package:chat_app/modules/style_manager/themes/saved_theme.dart';
import 'package:chat_app/modules/style_manager/themes/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/modules/storage_manager/preferences/user_preferences.dart';

import 'change_theme_event.dart';
import 'change_theme_state.dart';

class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {
  // static int initIndex = SavedTheme().initThemeIndex;
  ChangeThemeBloc()
      : super(ChangeThemeState(
          borderRadius: 20,
          fontSizeFactor: 1,
          primaryColor: MyApp().createMaterialColor(const Color(0xFFFF9800)),
          // primaryColor: Colors.blueGrey,
          brightness: Brightness.light,
          theme: CustomThemes().themes[6],
          index: 6,
        )) {
    on<SetThemeEvent>(_setThemeEvent);
    on<SetCustomThemesEvent>(_onSetCustomThemesEvent);
  }

  void _setThemeEvent(
      SetThemeEvent event, Emitter<ChangeThemeState> emit) async {
    await UserPreferences().setThemeEvent(event.index);
    // SavedTheme().initThemeIndex = event.index;
    // var i = await UserPreferences().getTheme();
    // print(i);
    emit(ChangeThemeState(
        primaryColor: CustomThemes().themes[event.index].primaryColor,
      fontSizeFactor: event.fontSizeFactor,
        brightness: CustomThemes().themes[event.index].brightness,
        borderRadius: 1,
        theme: CustomThemes().themes[event.index],
        index: event.index));
  }

  FutureOr<void> _onSetCustomThemesEvent(
      SetCustomThemesEvent event, Emitter<ChangeThemeState> emit) {
    print(event.index);
    print(event.fontSizeFactor);
    emit(ChangeThemeState(
      borderRadius: event.borderRadius,
      primaryColor: event.primaryColor,
      index: event.index,
      brightness: event.brightness,
      fontSizeFactor: event.fontSizeFactor,
    ));
  }
}
