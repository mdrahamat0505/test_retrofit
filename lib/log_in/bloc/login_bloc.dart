
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_app/models/all_user_data.dart';
import 'package:test_app/network/api_client.dart';
import 'package:test_app/utils/states.dart';
import 'package:dio/dio.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<GetLogin>(_onGetLoginToState);
  }

  void _onGetLoginToState(
      GetLogin event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: Status.loading));

    final local =await GetStorage();
    var token = await local.read("_token");
    var map = {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'};

  var client =  RestClient(
      Dio(
        BaseOptions(
          contentType: "application/json",
          baseUrl: 'http://restapi.adequateshop.com/api/',
          headers: map,
        ),

      ),
    );

    var loginup =  await  client.getAllUser();
   // final result = await _getLogin;

    if( loginup != null){

      AllUserData userData = AllUserData.fromJson(loginup);

      List<dynamic> data = loginup['data'];

      var userList = await (data as List).map((e) => Datum.fromJson(e)).toList();

      emit(
        state.copyWith(
          status: Status.success,
          users: userList,

        ),
      );
    }else{
      emit(
        state.copyWith(
            status: Status.error,

        ),
      );
    }

  }
}