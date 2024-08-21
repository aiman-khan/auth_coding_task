import 'package:aims_coding_task/features/auth/domain/repository/auth_repository.dart';
import 'package:aims_coding_task/infrastructure/usecase.dart';
import 'package:aims_coding_task/infrastructure/usecase_input.dart';
import 'package:aims_coding_task/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class LogoutUsecaseInput extends Input {
  LogoutUsecaseInput();
}

class LogoutUsecaseOutput extends Output {
  LogoutUsecaseOutput();
}

@lazySingleton
class LogoutUsecase extends Usecase<LogoutUsecaseInput, LogoutUsecaseOutput> {
  final AuthRepository _authRepository;

  LogoutUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<LogoutUsecaseOutput> call(LogoutUsecaseInput input) async {
    return await _authRepository.logout(input);
  }
}
