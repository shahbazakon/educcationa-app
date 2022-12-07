import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  /// define local storage variable
  static SharedPreferences? prefs;

  /// local Storages Keys
  static const token = "token";
  static const isRememberMe = "isRememberMe";
  static const fsmCode = "fsmCode";
  static String merchantName = "merchantName";
  static String merchantGSTNo = "merchantGSTNo";
  static String merchantPANNo = "merchantPANNo";

  /// Save String from Local Storage
  static Future<void> saveSharedPreferences(String key, String value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setString(key, value);
  }

  /// Get String from Local Storage
  static Future<String?> getPreferencesValue(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    String? value = myPrefs.getString(key);
    return value;
  }

  /// Save Boolean into Local Storage
  static Future<void> saveBoolSharedPreferences(String key, bool value) async {
    log("$key:$value");
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setBool(key, value);
  }

  /// Get Boolean from Local Storage
  static bool getBoolPreferencesValue(String key) {
    SharedPreferences myPrefs = SharedPreferences.getInstance() as SharedPreferences;
    bool? value = myPrefs.getBool(key);
    return value ?? false;
  }

  /// Clear User Local Data
  static clearLocal() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, (value));
  }
}
