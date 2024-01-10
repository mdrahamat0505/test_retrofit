import 'package:get_it/get_it.dart';
import 'package:test_app/di/service_di.dart';

final GetIt di = GetIt.instance;

Future<void> setupDio() async {
  await loginServiceModule();
}
