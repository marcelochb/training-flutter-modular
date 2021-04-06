abstract class LocalStorageInterface {
  Future<bool> getBoolean(String key);
  Future<String> getString(String key);
  Future saveBoolean(String key, bool value);
  Future saveString(String key, String value);
  Future delete(String key);
}
