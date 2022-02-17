


import 'package:dailyreach/network_api/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static SharedPreferences? _sharedPreferences;

  SharedPreference() {
    loadPrefs();
  }

  static loadPrefs() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static remove(String key) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences!.remove(key);
  }

  static Future clear() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences!.clear();
  }

  static Future clearData() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences!.remove(Constants.loginStatus);
  }

  static Future<void> saveStringValue(String key, String value) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences!.setString(key, value);
  }

  static Future<void> saveStringValueApple(String key, String value) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences!.setString(key, value);
  }

  static Future<void> saveBooleanValue(String key, bool value) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences!.setBool(key, value);
  }

  static Future<void> saveIntValue(String key, int value) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences!.setInt(key, value);
  }

  static Future<void> saveLoginStatus(String key, bool value) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences!.setBool(key, value);
  }

  getData(String key) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences!.getString(key);
  }

  static Future<String> getStringValuesSF(String key) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    //Return String
    String stringValue = _sharedPreferences!.getString(key) ?? "";
    return stringValue;
  }

  static Future<String> getStringValuesSFApple(String key) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    //Return String
    String stringValue = _sharedPreferences!.getString(key) ?? "";
    return stringValue;
  }

  static Future<bool> getLoginStatus(String key) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences!.getBool(key) ?? false;
  }

  static getIntValues(String key) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    //Return Integer
    int intValue = _sharedPreferences!.getInt(key)!;
    return intValue;
  }

  static Future<String> getStringList(String key) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    //Return Integer
    String intValue = _sharedPreferences!.getString(key)!;
    return intValue;
  }

  static Future<bool> getBoolean(String key) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    //Return Integer
    bool intValue = _sharedPreferences!.getBool(key) ?? false;
    return intValue;
  }


  static Future<void> saveListValue(String key, String value) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    _sharedPreferences!.setString(key, value);
  }
}

