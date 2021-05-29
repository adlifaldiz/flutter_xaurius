import 'dart:convert';

import 'package:flutter_xaurius/helper/debug_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart';

class LocalStorageService{
  static LocalStorageService _instance;
  static SharedPreferences _preferences;

  static final _key = Key.fromUtf8('com.kpbi.kemas.i');
  static final _iv = IV.fromLength(16);
  static final _encrypter = Encrypter(AES(_key));

  static const String _languagesKey = 'languages';
  static const String _accountKey = 'account';
  static const String _fcmTokenKey = 'fcm-token';
  static const String _userDataKey = 'user-data';
  static const String _onBoardFlagKey = 'on-boarding-flag';
  static const String _passwordKey = 'password';

  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService();
    }
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance;
  }

  static List<String> get languages => _getFromDisk(_languagesKey) ?? List<String>();
  static set languages(List<String> appLanguages) => _saveToDisk(_languagesKey, appLanguages);

  static String get account => _getFromDisk(_accountKey, decrypt: true);
  static set account(String check) => _saveToDisk(_accountKey, check, encrypt: true);

  static bool get onBoardingFlag => _getFromDisk(_onBoardFlagKey);
  static set onBoardingFlag(bool check) => _saveToDisk(_onBoardFlagKey, check);

  static String get fcmToken => _getFromDisk(_fcmTokenKey);
  static set fcmToken(String check) => _saveToDisk(_fcmTokenKey, check);

  static String get password => _getFromDisk(_passwordKey,decrypt: true);
  static set password(String value) => _saveToDisk(_passwordKey, value, encrypt: true);

  static dynamic get userData {
    if(_getFromDisk(_userDataKey) != null){
      return jsonDecode(_getFromDisk(_userDataKey, decrypt: true));
    }
    return null;
  }
  static set userData(dynamic userData) => _saveToDisk(_userDataKey, jsonEncode(userData), encrypt: true);
  static void setLogoutPref() {
    account = null;
  }

  /// Get dynamic value from all type preferences
  static dynamic _getFromDisk(String key, {bool decrypt = false}) {
    assert(_preferences != null);
    var value  = _preferences.get(key);
    if(decrypt && value != null) value = _encrypter.decrypt64(value, iv: _iv);
    printDebug('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value instansce of: ${value.runtimeType}');
    if(value is List) return value.cast<String>();
    return value;
  }

  /// Save data function that handles all types
  static void _saveToDisk<T>(String key, T content, {bool encrypt = false}){
    assert(_preferences != null);
    printDebug('(TRACE) LocalStorageService:_saveToDisk. key: $key value: $content');
    if(content == null){
      _preferences.remove(key);
    }
    if(content is String) {
      if(encrypt){
        var contentEncrypted = _encrypter.encrypt(content, iv: _iv);
        _preferences.setString(key, contentEncrypted.base64);
      }else{
        _preferences.setString(key, content);
      }
    }
    if(content is bool) {
      _preferences.setBool(key, content);
    }
    if(content is int) {
      _preferences.setInt(key, content);
    }
    if(content is double) {
      _preferences.setDouble(key, content);
    }
    if(content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }
}
