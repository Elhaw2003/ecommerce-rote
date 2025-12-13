import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/register_response_entity.dart';
import '../../domain/usecases/register_use_case.dart';

part 'register_state.dart';
@Injectable()
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerUseCase}) : super(RegisterInitialState());

  final RegisterUseCase registerUseCase;

  Future<void> register({required String email,required String password,required String name,required String rePassword,required String phone})async{
    emit(RegisterLoadingState());
    var result = await registerUseCase.call(email: email, password: password, name: name, rePassword: rePassword, phone: phone);
    return result.fold(
            (l){
              emit(RegisterFailureState(message: l.message));
            },
            (r){
              emit(RegisterSuccessState(registerResponseEntity: r));
            });
  }

}
