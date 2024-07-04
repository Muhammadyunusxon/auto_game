import 'package:shared_preferences/shared_preferences.dart';
import 'storage_keys.dart';

abstract class LocalStorage {
  LocalStorage._();

  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setToken(String? token) async {
    await _preferences?.setString(StorageKeys.keyToken, token ?? '');
  }

  static String getToken() =>
      _preferences?.getString(StorageKeys.keyToken) ?? '';

  static void _deleteToken() => _preferences?.remove(StorageKeys.keyToken);

  static Future<void> setTokens(List<String> tokens) async {
    await _preferences?.setStringList(StorageKeys.keyTokens, tokens);
  }

  static List<String> getTokens()  {
    return _preferences?.getStringList(StorageKeys.keyTokens) ?? [];
  }

  static void logout() {
    _deleteToken();
  }
}
