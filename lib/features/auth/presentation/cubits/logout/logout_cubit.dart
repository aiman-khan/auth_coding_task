import 'package:aims_coding_task/features/auth/presentation/cubits/logout/logout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  Future<void> logout() async {
    emit(LogoutLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(LogoutSuccess());
    } catch (e) {
      emit(const LogoutError("Logout failed"));
    }
  }
}
