import 'package:test_app/logIn/base_response.dart';
import 'package:test_app/logIn/repository/login_repository.dart';

import 'package:test_app/services/error_handler.dart';

class GetLoginUseCase {
  GetLoginUseCase({required LoginRepository repository})
      : _repository = repository;

  LoginRepository _repository;

  call({required Map<String, dynamic> map}) async {
    return _repository
        .getLogin(map: map)
        .then((value) => value)
        .onError((error, stackTrace) => ErrorHandler.error(
              error: error,
              stackTrace: stackTrace,
            ));
  }
}
