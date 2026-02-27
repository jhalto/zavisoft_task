import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<void> saveString(String key, String string) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

   await sharedPreferences.setString(key, string);
  }

  static Future<String?> getString(String key) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }
   static Future<bool> removeString(String key) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.remove(key);
  }
  static Future<void> saveInt(String key, int int) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

   await sharedPreferences.setInt(key, int);
  }
   static Future<int?> getInt(String key) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key);
  }
  static Future<void> removeSaved(String key)async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }
}
