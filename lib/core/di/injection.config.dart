// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:appwrite/appwrite.dart' as _i317;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sembast/sembast_io.dart' as _i156;

import '../../data/repositories/appwrite_auth_repository.dart' as _i692;
import '../../domain/repositories/i_auth_repository.dart' as _i841;
import '../../presentation/blocs/auth/auth_cubit.dart' as _i15;
import '../router/app_router.dart' as _i81;
import 'app_module.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    await gh.singletonAsync<_i156.Database>(
      () => appModule.sembastDatabase,
      preResolve: true,
    );
    gh.singleton<_i81.AppRouter>(() => _i81.AppRouter());
    gh.lazySingleton<_i317.Client>(() => appModule.appwriteClient);
    gh.lazySingleton<_i317.Account>(() => appModule.appwriteAccount);
    gh.lazySingleton<_i317.Databases>(() => appModule.appwriteDatabases);
    gh.lazySingleton<_i317.Storage>(() => appModule.appwriteStorage);
    gh.lazySingleton<_i841.IAuthRepository>(
      () => _i692.AppwriteAuthRepository(gh<_i317.Account>()),
    );
    gh.factory<_i15.AuthCubit>(
      () => _i15.AuthCubit(gh<_i841.IAuthRepository>()),
    );
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}
