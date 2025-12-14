import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/forgot_password_use_case.dart';

part 'forgot_password_state.dart';
@Injectable()
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit({required this.forgotPasswordUseCase}) : super(ForgotPasswordInitialState());

  final ForgotPasswordUseCase forgotPasswordUseCase;

  Future<void> forgotPassword  ({required String email})async{
    emit(ForgotPasswordLoadingState());
    var result = await forgotPasswordUseCase.call(email: email);
    return result.fold(
            (l){
              emit(ForgotPasswordFailureState(message: l.message));
            },
            (r){
              emit(ForgotPasswordSuccessState(successMessage: r));
            });
  }

}
