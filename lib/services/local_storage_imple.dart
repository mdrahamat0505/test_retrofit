

import 'package:get_storage/get_storage.dart';
import 'package:test_app/services/local_storage.dart';

class LocalStorageImple extends LocalStorage{

  final local = GetStorage();
  static const _kThemeKey = '_theme';
  static const _kTokenKey = '_token';
  static const _kUserIdKey = '_user';
  @override
  String? getTheme() {
    // TODO: implement getTheme
    return local.read(_kThemeKey);
  }

  @override
  String? getToken() {
    // TODO: implement getToken
    return local.read(_kTokenKey);
  }

  @override
  int? getUserId() {
    // TODO: implement getUserId
    return local.read(_kUserIdKey);
  }

  @override
  Future<void> removeSession() async{
    // TODO: implement removeSession
    local.remove(_kTokenKey);
    local.remove(_kUserIdKey);
  }

  @override
  Future<void> setSession({required String token, required int userId}) async{
    // TODO: implement setSession
    local.write(_kTokenKey, token);
    local.write(_kUserIdKey, userId);
  }

  @override
  Future<void> setTheme(String value) async{
    // TODO: implement setTheme
    local.write(_kThemeKey, value);
  }

  @override
  Future<void> setToken(String token) async{
    // TODO: implement setToken
    local.write(_kTokenKey, token);
  }







}