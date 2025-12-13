part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitialState extends RegisterState {}
final class RegisterLoadingState extends RegisterState {}
final class RegisterSuccessState extends RegisterState {
  final RegisterResponseEntity registerResponseEntity;

  RegisterSuccessState({required this.registerResponseEntity});
}
final class RegisterFailureState extends RegisterState {
  final String message;

  RegisterFailureState({required this.message});
}
