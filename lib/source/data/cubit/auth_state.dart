part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class SplashLoading extends AuthState {}

class SplashLoaded extends AuthState {}

class LoginLoading extends AuthState {}

class LoginLoaded extends AuthState {}

class LoginError extends AuthState {
  final dynamic error;

  LoginError({this.error});
}

class LoginMessage extends AuthState {
  final String? message;

  LoginMessage({this.message});
}

class LoginMessageSuccess extends AuthState {
  final String? message;

  LoginMessageSuccess({this.message});
}

class RegisterLoading extends AuthState {}

class RegisterLoaded extends AuthState {}

class RegisterError extends AuthState {
  final dynamic error;

  RegisterError({this.error});
}

class RegisterMessage extends AuthState {
  final String? message;

  RegisterMessage({this.message});
}

class RegisterMessageSuccess extends AuthState {
  final String? message;

  RegisterMessageSuccess({this.message});
}
