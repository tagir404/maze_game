import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService extends ChangeNotifier {
  SettingsService(this._prefs);

  static const _localeKey = 'locale_code';
  static const _themeModeKey = 'theme_mode';

  final SharedPreferences? _prefs;

  Locale? _locale;
  ThemeMode _themeMode = ThemeMode.system;
  bool _soundEnabled = true;

  Locale? get locale => _locale;
  ThemeMode get themeMode => _themeMode;
  bool get soundEnabled => _soundEnabled;

  Future<void> load() async {
    final localeCode = _prefs?.getString(_localeKey);
    if (localeCode != null) {
      _locale = Locale(localeCode);
    }

    final themeModeName = _prefs?.getString(_themeModeKey);
    _themeMode = ThemeMode.values.firstWhere(
      (mode) => mode.name == themeModeName,
      orElse: () => ThemeMode.system,
    );

    _soundEnabled = _prefs?.getBool('soundEnabled') ?? true;
  }

  Future<void> setLocale(Locale? locale) async {
    _locale = locale;
    if (locale == null) {
      await _prefs?.remove(_localeKey);
    } else {
      await _prefs?.setString(_localeKey, locale.languageCode);
    }
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    _themeMode = themeMode;
    await _prefs?.setString(_themeModeKey, themeMode.name);
    notifyListeners();
  }

  Future<void> setSoundEnabled(bool value) async {
    if (_soundEnabled == value) return;

    _soundEnabled = value;

    await _prefs?.setBool('soundEnabled', value);

    notifyListeners();
  }
}
