import 'package:shared_preferences/shared_preferences.dart';
// singleton

class SharedUtils {
  //static create when open the app and die when clos
  // can access any function direct in class
  // can make two function one set all value and other one get with map

  //make object from Shared can be null
  static SharedPreferences? sharedPreferences;
  // make check if shared null is true make new shared if else return the shared
  static Future<SharedPreferences> get instance async {
    return sharedPreferences ??= await SharedPreferences.getInstance();
  }

  // make use in main runApp  // Initialize the SharedPreferences instance
  static Future<SharedPreferences> init() async {
    sharedPreferences = await instance;
    return sharedPreferences!;
  }

  // make var and equal shared and add the string
  static Future<bool> setString2(String key, String value) async {
    var pref = await instance;
    return pref.setString(key, value);
  }

  // set String in Shared direct
  static Future<void> setString(String key, String value) async {
    await sharedPreferences?.setString(key, value);
  }

// make to return String
  static String getString(String key, [String deValue = '']) {
    return sharedPreferences!.getString(key) ?? deValue;
  }

  // set bool in Shared direct
  static Future<void> setBool(String key, bool value) async {
    await sharedPreferences?.setBool(key, value);
  }

// make to return bool
  static bool getBool(String key, [bool deValue = true]) {
    return sharedPreferences!.getBool(key) ?? deValue;
  }

  // set int in Shared direct
  static Future<void> setInt(String key, int value) async {
    await sharedPreferences?.setInt(key, value);
  }

// make to return int
  static int getInt(String key, [int deValue = 0]) {
    return sharedPreferences!.getInt(key) ?? deValue;
  }
}
