import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static StorageUtil? _storageUtil;
  static SharedPreferences? _preferences;

  static Future<StorageUtil> getInstance() async {
    if (_storageUtil == null) {
      var secureStorage = StorageUtil._internal();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil!;
  }

  StorageUtil._internal();

  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // put string
  static Future<bool> putString(String key, String value) {
    return _preferences!.setString(key, value);
  }

  //I have also created method to get data from Preference.
  // get string
  static String getString(String key, {String defValue = ""}) {
    if (_preferences == null) return defValue;
    return _preferences!.getString(key) ?? defValue;
  }

  // put Bool
  static Future<bool> putBool(String key, bool value) {
    return _preferences!.setBool(key, value);
  }

  //I have also created method to get data from Preference.
  // get Bool
  static bool getBool(String key, {bool defValue = false}) {
    if (_preferences == null) return defValue;
    return _preferences!.getBool(key) ?? defValue;
  }

  static Future<bool> putInt(String key, int value) {
    return _preferences!.setInt(key, value);
  }

  static int getInt(String key, {int defValue = 0}) {
    if (_preferences == null) return defValue;
    return _preferences!.getInt(key) ?? defValue;
  }

  //Also I Have Method that will clear data from Preference.
  // clear string
  static Future<bool> clearString() {
    SharedPreferences prefs = _preferences!;
    return prefs.clear();
  }

  static Future<bool> removeData(String key) {
    SharedPreferences prefs = _preferences!;
    return prefs.remove(key);
  }

  static bool hasData(String key) {
    SharedPreferences prefs = _preferences!;
    return prefs.containsKey(key);
  }
}

/*
class StorageUtil {
  static StorageUtil? _storageUtil;
  // static SharedPreferences? _preferences;
  static GetStorage? _preferences;

  static Future<StorageUtil> getInstance() async {
    if (_storageUtil == null) {
      var secureStorage = StorageUtil._internal();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil!;
  }

  StorageUtil._internal();

  Future _init() async {
    // _preferences = await SharedPreferences.getInstance();
    _preferences = GetStorage('FlutterSharedPreferences');
  }

  // put string
  static Future<bool> putString(String key, String value) {
    _preferences!.write(key, value);
    return Future.value(true);
  }

  //I have also created method to get data from Preference.
  // get string
  static String getString(String key, {String defValue = ""}) {
    if (_preferences == null) return defValue;
    return _preferences!.read(key) ?? defValue;

  }

  // put Bool
  static Future<bool> putBool(String key, bool value) {
    _preferences!.write(key, value);
    return Future.value(true);
  }

  //I have also created method to get data from Preference.
  // get Bool
  static bool getBool(String key, {bool defValue = false}) {
    if (_preferences == null) return defValue;
    return _preferences!.read(key) ?? defValue;
  }

  static Future<bool> putInt(String key, int value) {
    _preferences!.write(key, value);
    return Future.value(true);
  }

  static int getInt(String key, {int defValue = 0}) {
    if (_preferences == null) return defValue;
    return _preferences!.read(key) ?? defValue;
  }

  //Also I Have Method that will clear data from Preference.
  // clear string
  static Future<bool> clearString() {
    _preferences!.erase();
    return Future.value(true);
  }

  static Future<bool> removeData(String key) {
    _preferences!.remove(key);
    return Future.value(true);
  }

  static bool hasData(String key) {
    return _preferences!.hasData(key);
  }
}*/
