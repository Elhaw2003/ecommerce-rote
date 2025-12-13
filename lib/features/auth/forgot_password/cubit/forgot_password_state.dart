part of 'forgot_password_cubit.dart';

@immutable
sealed class ForgotPasswordState {}

final class ForgotPasswordInitialState extends ForgotPasswordState {}
final class ForgotPasswordLoadingState extends ForgotPasswordState {}
final class ForgotPasswordSuccessState extends ForgotPasswordState {
  final String success;

  ForgotPasswordSuccessState({required this.success});
}
final class ForgotPasswordFailureState extends ForgotPasswordState {
  final String message;

  ForgotPasswordFailureState({required this.message});
}
