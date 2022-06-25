import 'dart:async';

import 'package:mobx/mobx.dart';

import 'session_handler.dart';

part 'config_store.g.dart';

class ConfigStore = _ConfigStoreBase with _$ConfigStore;

abstract class _ConfigStoreBase with Store {
  _ConfigStoreBase({
    required AppSession appSession,
    required SessionHandler sessionHandler,
  })  : _sessionHandler = sessionHandler,
        _locale = appSession.locale,
        _isDarkMode = appSession.isDarkMode;

  final SessionHandler _sessionHandler;

  @readonly
  Language _locale;

  @readonly
  bool? _isDarkMode;

  @action
  Future<void> setLocale(Language language) async {
    await _sessionHandler.setLanguage(language);
    _locale = language;
  }

  @action
  Future<void> setThemeMode(bool isDarkMode) async {
    await _sessionHandler.setThemeMode(isDarkMode);
    _isDarkMode = isDarkMode;
  }

  void dispose() {}
}

class AppSession {
  AppSession({
    required this.locale,
    this.isDarkMode,
  });
  final Language locale;
  final bool? isDarkMode;
}

enum Language {
  english,
  arabic,
}
