// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConfigStore on _ConfigStoreBase, Store {
  final _$_localeAtom = Atom(name: '_ConfigStoreBase._locale');

  Language get locale {
    _$_localeAtom.reportRead();
    return super._locale;
  }

  @override
  Language get _locale => locale;

  @override
  set _locale(Language value) {
    _$_localeAtom.reportWrite(value, super._locale, () {
      super._locale = value;
    });
  }

  final _$_isDarkModeAtom = Atom(name: '_ConfigStoreBase._isDarkMode');

  bool? get isDarkMode {
    _$_isDarkModeAtom.reportRead();
    return super._isDarkMode;
  }

  @override
  bool? get _isDarkMode => isDarkMode;

  @override
  set _isDarkMode(bool? value) {
    _$_isDarkModeAtom.reportWrite(value, super._isDarkMode, () {
      super._isDarkMode = value;
    });
  }

  final _$setLocaleAsyncAction = AsyncAction('_ConfigStoreBase.setLocale');

  @override
  Future<void> setLocale(Language language) {
    return _$setLocaleAsyncAction.run(() => super.setLocale(language));
  }

  final _$setThemeModeAsyncAction =
      AsyncAction('_ConfigStoreBase.setThemeMode');

  @override
  Future<void> setThemeMode(bool isDarkMode) {
    return _$setThemeModeAsyncAction.run(() => super.setThemeMode(isDarkMode));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
