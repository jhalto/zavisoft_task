
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  // Create storage instance (can be static)
  static const _storage = FlutterSecureStorage();

  /// Save a string securely
  static Future<void> saveString(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  /// Read a string securely
  static Future<String?> getString(String key) async {
    return await _storage.read(key: key);
  }

  /// Delete a value securely
  static Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  /// Delete all stored values securely
  static Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  /// Check if a key exists
  static Future<bool> containsKey(String key) async {
    return await _storage.containsKey(key: key);
  }
}