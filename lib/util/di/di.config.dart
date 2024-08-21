// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

import '../../features/auth/data/repository/auth_repository_imp.dart' as _i794;
import '../../features/auth/data/source/firebase/auth_firebase_datasource_imp.dart'
    as _i448;
import '../../features/auth/domain/data/auth_remote_datasource.dart' as _i998;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/usecases/login.dart' as _i428;
import '../../features/auth/domain/usecases/logout.dart' as _i597;
import 'di.dart' as _i913;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i974.Logger>(() => _i913.LoggerImp());
    gh.lazySingleton<_i998.AuthFirebaseDataSource>(
        () => _i448.AuthFirebaseDataSourceImp(logger: gh<_i974.Logger>()));
    gh.lazySingleton<_i961.AuthRepository>(() => _i794.AuthRepositoryImp(
        authRemoteDataSource: gh<_i998.AuthFirebaseDataSource>()));
    gh.lazySingleton<_i428.LoginUsecase>(
        () => _i428.LoginUsecase(authRepository: gh<_i961.AuthRepository>()));
    gh.lazySingleton<_i597.LogoutUsecase>(
        () => _i597.LogoutUsecase(authRepository: gh<_i961.AuthRepository>()));
    return this;
  }
}
