part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = Status.initial,
    this.message = '',
    this.users = const [],
  });

  @override
  final Status status;
  final String message;
  final List<Datum> users;

  LoginState copyWith({
    Status? status,
    String? message,
    List<Datum>? users,
  }) {
    return LoginState(
      status: status ?? this.status,
      message: message ?? this.message,
      users: users ?? this.users,
    );
  }

  @override
  List<Object?> get props => [status, message, users];
}
