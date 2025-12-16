part of 'changed_password_cubit.dart';

@immutable
sealed class ChangedPasswordState {}

final class ChangedPasswordInitialState extends ChangedPasswordState {}
final class ChangedPasswordLoadingState extends ChangedPasswordState {}
final class ChangedPasswordSuccessState extends ChangedPasswordState {
  final String successMessage;

  ChangedPasswordSuccessState({required this.successMessage});
}
final class ChangedPasswordFailureState extends ChangedPasswordState {
  final String message;

  ChangedPasswordFailureState({required this.message});
}
