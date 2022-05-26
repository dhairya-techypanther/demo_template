import 'package:shared_preferences/shared_preferences.dart';

typedef StringList = List<String>;


class SharedPrefs {
  ///Use Shared Preference keys from [PrefKeys]

  SharedPrefs._internal();

  static final SharedPrefs _instance = SharedPrefs._internal();

  static SharedPrefs get instance => _instance;
  static late SharedPreferences pref;

  static Future<void> initSharedPrefs() async {
    pref = await SharedPreferences.getInstance();
  }

  /// Set the value to the shared preferences.
  /// await UserPreference().setValue(key: SharedPrefKeys.counter.name, value: value + 1);
  static setValue({required String key, var value}) async {
    switch (value.runtimeType) {
      case String:
        pref.setString(key, value);
        break;
      case int:
        pref.setInt(key, value);
        break;
      case bool:
        pref.setBool(key, value);
        break;
      case double:
        pref.setDouble(key, value);
        break;
      case StringList:
        pref.setStringList(key, value);
        break;
    }
  }
}