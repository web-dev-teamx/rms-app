import 'package:shared_preferences/shared_preferences.dart';

import 'config_store.dart';

class SessionHandler {
  static const String keyToken = 'token';
  static const String keyDeviceUUID = 'deviceUUID';
  static const String keyUser = 'user';
  static const String _keyStringLanguage = 'language';
  static const String _keyEnglish = 'english';
  static const String _keyArabic = 'arabic';
  static const String _keythemeMode = 'darkMode';

  SharedPreferences? _sharedPreferences;

  Future<SharedPreferences> _getSharedPreferences() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences!;
  }

  Future<bool> hasSession() async {
    final token = await getToken();
    return token != null;
  }

  Future<bool> isLoggedIn() async {
    // final user = await getUser();
    final token = await getToken();
    return token != null; // && user != null;
  }

  Future<void> signOut() async {
    final sharedPreferences = await _getSharedPreferences();
    await sharedPreferences.clear();
  }

  Future<void> setSession(
    String authToken,
    String deviceUuid,
  ) async {
    await setToken(authToken);
    await _setDeviceUUID(deviceUuid);
  }

  Future<String?> getToken() async {
    final sharedPreferences = await _getSharedPreferences();
    return sharedPreferences.getString(keyToken);
  }

  Future<void> setToken(String value) async {
    final sharedPreferences = await _getSharedPreferences();
    await sharedPreferences.setString(keyToken, value);
  }

  Future<String?> getDeviceUUID() async {
    final sharedPreferences = await _getSharedPreferences();
    return sharedPreferences.getString(keyDeviceUUID);
  }

  Future<void> _setDeviceUUID(String value) async {
    final sharedPreferences = await _getSharedPreferences();
    await sharedPreferences.setString(keyDeviceUUID, value);
  }

  Future<Language> getLanguage() async {
    final sharedPreferences = await _getSharedPreferences();
    final language = sharedPreferences.getString(_keyStringLanguage);
    switch (language) {
      case _keyEnglish:
        return Language.english;
      case _keyArabic:
        return Language.arabic;
      default:
        return Language.english;
    }
  }

  Future<bool?> getThemeMode() async {
    final sharedPreferences = await _getSharedPreferences();
    final  isDarkMode = sharedPreferences.getBool(_keythemeMode);
    return isDarkMode;
  }

  Future<void> setThemeMode(bool isDarkMode) async {
    final sharedPreferences = await _getSharedPreferences();
    await sharedPreferences.setBool(
      _keythemeMode,
      isDarkMode,
    );
  }

  Future<void> setLanguage(Language language) async {
    final sharedPreferences = await _getSharedPreferences();
    final String languageInString;
    switch (language) {
      case Language.english:
        languageInString = _keyEnglish;
        break;
      case Language.arabic:
        languageInString = _keyArabic;
        break;
    }
    await sharedPreferences.setString(
      _keyStringLanguage,
      languageInString,
    );
  }
}
