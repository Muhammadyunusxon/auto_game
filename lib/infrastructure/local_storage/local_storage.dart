import 'package:shared_preferences/shared_preferences.dart';
import 'storage_keys.dart';

class LocalStorage {
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

  static void logout() {
    _deleteToken();
  }
}
