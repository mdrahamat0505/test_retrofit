import 'package:test_app/log_in/base_response.dart';
import 'package:test_app/network/api_client.dart';
import 'package:test_app/services/local_storage.dart';

import '../../log_in/repository/login_repository.dart';

class UserRepositoryImpl implements LoginRepository {
  UserRepositoryImpl({
    required RestClient client,
    required LocalStorage sharePref,
  })  : _client = client,
        _sharePref = sharePref;

  final RestClient _client;
  final LocalStorage _sharePref;

  @override
  Future<BaseResponse> getLogin({required Map<String, dynamic> map}) async {
    return await _client.login(map);
  }
}
