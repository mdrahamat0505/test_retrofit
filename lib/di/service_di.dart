
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_app/di/interjection_service.dart';
import 'package:test_app/log_in/use_case/get_login_use_case.dart';
import 'package:test_app/network/api_client.dart';
import 'package:test_app/services/local_storage.dart';
import 'package:test_app/services/local_storage_imple.dart';

Future<void> loginServiceModule() async {



  di.registerLazySingleton<LocalStorage>(() => LocalStorageImple());
  // final local = GetStorage();
  // final _localStorage = di.get<LocalStorage>();
  // String? token = _localStorage.getToken();

  di.registerLazySingleton<RestClient>(
        () => RestClient(
      Dio(
        BaseOptions(
          contentType: "application/json",
          baseUrl: 'http://restapi.adequateshop.com/api/',

        ),

      ),
    ),
  );

  di.registerLazySingleton<GetLoginUseCase>(
        () => GetLoginUseCase(repository: di()),
  );


}