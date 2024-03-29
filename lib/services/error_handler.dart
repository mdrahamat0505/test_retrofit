import 'dart:convert';
import 'package:dio/dio.dart';

import 'dart:developer' as logdev;

import 'package:test_app/logIn/base_response.dart';

class ErrorHandler {
  static BaseResponse<T> error<T>({Object? error, StackTrace? stackTrace}) {
    logdev.log(jsonEncode(error));
    logdev.log(jsonEncode(stackTrace));

    switch (error.runtimeType) {
      case DioException:
        final res = (error as DioException).response;
        var message = res?.data['message'];
        var newResponse = BaseResponse<T>(
          statusCode: res?.statusCode ?? 404,
          message: message ?? res?.statusMessage ?? '',
        );
        return newResponse;

      default:
        return BaseResponse<T>(message: 'Something wrong!', statusCode: 404);
    }
  }
}
