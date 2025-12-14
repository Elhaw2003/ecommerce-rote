part of 'verify_otp_cubit.dart';

@immutable
sealed class VerifyOtpState {}

final class VerifyOtpInitialState extends VerifyOtpState {}
final class VerifyOtpLoadingState extends VerifyOtpState {}
final class VerifyOtpSuccessState extends VerifyOtpState {
  final String successMessage;

  VerifyOtpSuccessState({required this.successMessage});
}
final class VerifyOtpFailureState extends VerifyOtpState {
  final String message;

  VerifyOtpFailureState({required this.message});
}
