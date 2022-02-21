import 'package:shared_preferences/shared_preferences.dart';

class CommonMethod {
  static bool validateEmail(String value) {
    if (value.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  static bool validatePassword(String value) {
    if (value.isEmpty) {
      return false;
    } else if (value.length < 6) {
      return true;
    } else {
      return true;
    }
  }
}

class SharedPref{
  static  SharedPreferences? pref;

  static Future<void>? saveData(String key,String value) async {
    pref  = await SharedPreferences.getInstance();
    pref!.setString(key, value);

  }
  static Future<String>? getData(String key) async{

    pref  = await SharedPreferences.getInstance();
    return pref!.getString(key)??"";

  }




}