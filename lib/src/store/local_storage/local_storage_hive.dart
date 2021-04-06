import 'dart:async';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'local_storage_interface.dart';

class LocalStorageHive implements LocalStorageInterface {
  Completer<Box> _instance = Completer<Box>();

  _init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    var box = Hive.openBox('db');
    _instance.complete(box);
  }

  LocalStorageHive() {
    _init();
  }

  @override
  Future delete(String key) async {
    var box = await _instance.future;
    box.delete(key);
  }

  @override
  Future<bool> getBoolean(String key) async {
    var box = await _instance.future;
    return box.get(key);
  }

  @override
  Future saveBoolean(String key, bool value) async {
    var box = await _instance.future;
    box.put(key, value);
  }

  @override
  Future<String> getString(String key) async {
    var box = await _instance.future;
    return box.get(key);
  }

  @override
  Future saveString(String key, String value) async {
    var box = await _instance.future;
    box.put(key, value);
  }
}
