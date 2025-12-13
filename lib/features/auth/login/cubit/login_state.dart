part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitialState extends LoginState {}
final class LoginLoadingState extends LoginState {}
final class LoginSuccessState extends LoginState {
  final LoginResponseEntity loginResponseEntity;

  LoginSuccessState({required this.loginResponseEntity});
}
final class LoginFailureState extends LoginState {
  final String message;

  LoginFailureState({required this.message});
}
