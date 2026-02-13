import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

@lazySingleton
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SharedPreferences _prefs;
  static const String _themeKey = 'theme_mode';

  SettingsBloc(this._prefs) : super(const SettingsState.initial()) {
    on<_Started>((event, emit) {
      final themeIndex = _prefs.getInt(_themeKey) ?? 0; // Default to System (0)
      emit(SettingsState.loaded(themeMode: ThemeMode.values[themeIndex]));
    });

    on<_ThemeChanged>((event, emit) async {
      await _prefs.setInt(_themeKey, event.themeMode.index);
      emit(SettingsState.loaded(themeMode: event.themeMode));
    });
  }
}
