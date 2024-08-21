import 'package:aims_coding_task/features/auth/domain/data/auth_remote_datasource.dart';
import 'package:aims_coding_task/features/auth/domain/repository/auth_repository.dart';
import 'package:aims_coding_task/features/auth/domain/usecases/login.dart';
import 'package:aims_coding_task/features/auth/domain/usecases/logout.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImp implements AuthRepository {
  final AuthFirebaseDataSource _authFirebaseDataSource;

  AuthRepositoryImp({
    required AuthFirebaseDataSource authRemoteDataSource,
  }) : _authFirebaseDataSource = authRemoteDataSource;

  @override
  Future<LoginUsecaseOutput> login(LoginUsecaseInput input) async {
    return _authFirebaseDataSource.login(input);
  }

  @override
  Future<LogoutUsecaseOutput> logout(LogoutUsecaseInput input) {
    return _authFirebaseDataSource.logout(input);
  }
}
