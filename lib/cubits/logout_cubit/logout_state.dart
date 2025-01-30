part of 'logout_cubit.dart';

@immutable
abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutError extends LogoutState {
  final String message;
  LogoutError(this.message);
}

class LogoutSuccess extends LogoutState {}
