import 'package:bloc/bloc.dart';
import 'package:ecommerce_rote/features/auth/domain/entities/login_response_entity.dart';
import 'package:ecommerce_rote/features/auth/domain/usecases/login_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';
@Injectable()
class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase}) : super(LoginInitialState());

  final LoginUseCase loginUseCase;

  Future<void> login  ({required String email , required String password})async{
    emit(LoginLoadingState());
    var result = await loginUseCase.call(email: email, password: password);
    return result.fold(
            (l){
              emit(LoginFailureState(message: l.message));
            },
            (r){
              emit(LoginSuccessState(loginResponseEntity: r));
            });
  }

}
