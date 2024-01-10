abstract class LocalStorage {
  String? getTheme();

  String? getToken();
  Future<void> setToken(String token);

  int? getUserId();

  Future<void> setTheme(String value);

  Future<void> setSession({required String token, required int userId});

  Future<void> removeSession();

  // Future<void> setTokenId({required String token, required int userId}) async {
  //   _sharedPref.write(_kTokenKey, token);
  //   _sharedPref.write(_kUserIdKey, userId);
  // }
}
