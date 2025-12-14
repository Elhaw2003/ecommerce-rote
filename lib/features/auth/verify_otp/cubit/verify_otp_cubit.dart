import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../domain/usecases/verify_otp_use_case.dart';
part 'verify_otp_state.dart';
@Injectable()
class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit({required this.verifyOtpUseCase}) : super(VerifyOtpInitialState());

  final VerifyOtpUseCase verifyOtpUseCase;

  Future<void> verifyOtp  ({required String resetCode})async{
    emit(VerifyOtpLoadingState());
    var result = await verifyOtpUseCase.call(resetCode: resetCode);
    return result.fold(
            (l){
              emit(VerifyOtpFailureState(message: l.message));
            },
            (r){
              emit(VerifyOtpSuccessState(successMessage: r));
            });
  }

}
