import 'dart:async';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage_interface.dart';

class LocalStorageSharedPreference implements LocalStorageInterface {
  Completer<SharedPreferences> _instance = Completer<SharedPreferences>();

  _init() async {
    _instance.complete(await SharedPreferences.getInstance());
  }

  LocalStorageSharedPreference() {
    _init();
  }

  @override
  Future delete(String key) async {
    var shared = await _instance.future;
    shared.remove(key);
  }

  @override
  Future<bool> getBoolean(String key) async {
    var shared = await _instance.future;
    return shared.getBool(key);
  }

  @override
  Future saveBoolean(String key, bool value) async {
    var shared = await _instance.future;
    shared.setBool(key, value);
  }

  @override
  Future<String> getString(String key) async {
    var shared = await _instance.future;
    return shared.getString(key);
  }

  @override
  Future saveString(String key, String value) async {
    var shared = await _instance.future;
    shared.setString(key, value);
  }
}
