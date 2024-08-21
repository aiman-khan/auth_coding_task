import 'package:aims_coding_task/features/auth/domain/repository/auth_repository.dart';
import 'package:aims_coding_task/infrastructure/usecase.dart';
import 'package:aims_coding_task/infrastructure/usecase_input.dart';
import 'package:aims_coding_task/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class LoginUsecaseInput extends Input {
  LoginUsecaseInput({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class LoginUsecaseOutput extends Output {
  LoginUsecaseOutput({required this.token});

  final String token;
}

@lazySingleton
class LoginUsecase extends Usecase<LoginUsecaseInput, LoginUsecaseOutput> {
  final AuthRepository _authRepository;

  LoginUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<LoginUsecaseOutput> call(LoginUsecaseInput input) async {
    return await _authRepository.login(input);
  }
}
