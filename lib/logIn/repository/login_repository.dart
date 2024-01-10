import 'package:test_app/logIn/base_response.dart';

abstract class LoginRepository {
  Future<BaseResponse<dynamic>> getLogin({required Map<String, dynamic> map});

  //Future<BaseResponse<dynamic>> getProduct({required int id});
}
