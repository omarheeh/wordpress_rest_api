part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSucsess extends AuthState {}

final class AuthFailure extends AuthState {
  final String errMessage;
  AuthFailure(this.errMessage);
}

final class AuthLogout extends AuthState {}
