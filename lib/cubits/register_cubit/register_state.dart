part of 'register_cubit.dart';


@immutable
class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterError extends RegisterState {
  final String message;
  RegisterError({required this.message});
}

class RegisterSuccess extends RegisterState {
  final User user;
  RegisterSuccess(this.user);
}
