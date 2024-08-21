import 'package:aims_coding_task/features/auth/domain/usecases/login.dart';
import 'package:aims_coding_task/features/auth/presentation/cubits/login/login_state.dart';
import 'package:aims_coding_task/util/exceptions/message_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginDriverUsecase;

  LoginCubit({
    required this.loginDriverUsecase,
  }) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());

    try {
      final input = LoginUsecaseInput(
        email: email,
        password: password,
      );
      final output = await loginDriverUsecase(input);

      emit(LoginSuccess(output.token));
    } on FirebaseAuthException catch (e) {
      emit(LoginError(e.message!));
    } on SomethingWentWrongException catch (e) {
      emit(LoginError(e.message));
    } on MessageException catch (e) {
      emit(LoginError(e.message));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
