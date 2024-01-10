import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_app/logIn/base_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "http://restapi.adequateshop.com/api/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("authaccount/login")
  Future<dynamic> login(@Body() Map<String, dynamic> map);

  @POST("authaccount/registration")
  Future<dynamic> register(@Body() Map<String, dynamic> map);

  @GET("users")
  Future<dynamic> getAllUser();

  // @POST("users/293788")
  // Future<dynamic> updateUser(@Body() Map<String, dynamic> map);
}
