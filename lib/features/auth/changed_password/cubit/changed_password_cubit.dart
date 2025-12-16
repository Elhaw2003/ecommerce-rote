import 'package:bloc/bloc.dart';
import 'package:ecommerce_rote/features/auth/domain/usecases/change_password_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
part 'changed_password_state.dart';
@Injectable()
class ChangedPasswordCubit extends Cubit<ChangedPasswordState> {
  ChangedPasswordCubit({required this.changePasswordUseCase}) : super(ChangedPasswordInitialState());

  final ChangePasswordUseCase changePasswordUseCase;

  Future<void> changePassword  ({required String email,required String newPassword})async{
    emit(ChangedPasswordLoadingState());
    var result = await changePasswordUseCase.call(email: email,newPassword: newPassword);
    return result.fold(
            (l){
              emit(ChangedPasswordFailureState(message: l.message));
            },
            (r){
              emit(ChangedPasswordSuccessState(successMessage: r));
            });
  }

}
