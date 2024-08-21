import 'package:aims_coding_task/features/auth/domain/usecases/login.dart';
import 'package:aims_coding_task/features/auth/domain/usecases/logout.dart';
import 'package:aims_coding_task/infrastructure/repository.dart';

abstract class AuthRepository extends Repository {
  Future<LoginUsecaseOutput> login(LoginUsecaseInput input);

  Future<LogoutUsecaseOutput> logout(LogoutUsecaseInput input);
}
