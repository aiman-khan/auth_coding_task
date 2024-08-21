// path: lib/features/auth/presentation/cubits/login/login_state.dart

import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;

  const LoginSuccess(this.token);

  @override
  List<Object> get props => [token];
}

class LoginError extends LoginState {
  final String errorMessage;

  const LoginError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
