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
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:zentory_app/core/database/objectbox_database.dart' as _i591;
import 'package:zentory_app/core/di/appwrite_module.dart' as _i914;
import 'package:zentory_app/core/di/database_module.dart' as _i75;
import 'package:zentory_app/core/network/connectivity_bloc.dart' as _i1034;
import 'package:zentory_app/core/network/sync_manager.dart' as _i31;
import 'package:zentory_app/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i982;
import 'package:zentory_app/features/auth/data/repositories/auth_repository_impl.dart'
    as _i449;
import 'package:zentory_app/features/auth/domain/repositories/auth_repository.dart'
    as _i397;
import 'package:zentory_app/features/auth/domain/usecases/get_current_user_usecase.dart'
    as _i375;
import 'package:zentory_app/features/auth/domain/usecases/login_usecase.dart'
    as _i38;
import 'package:zentory_app/features/auth/domain/usecases/logout_usecase.dart'
    as _i85;
import 'package:zentory_app/features/auth/domain/usecases/register_usecase.dart'
    as _i143;
import 'package:zentory_app/features/auth/domain/usecases/update_password_usecase.dart'
    as _i434;
import 'package:zentory_app/features/auth/domain/usecases/update_profile_usecase.dart'
    as _i742;
import 'package:zentory_app/features/auth/presentation/bloc/auth_bloc.dart'
    as _i475;
import 'package:zentory_app/features/inventory/data/datasources/inventory_local_data_source.dart'
    as _i67;
import 'package:zentory_app/features/inventory/data/datasources/inventory_remote_data_source.dart'
    as _i909;
import 'package:zentory_app/features/inventory/data/datasources/movement_local_data_source.dart'
    as _i442;
import 'package:zentory_app/features/inventory/data/datasources/movement_remote_data_source.dart'
    as _i595;
import 'package:zentory_app/features/inventory/data/repositories/inventory_repository_impl.dart'
    as _i1061;
import 'package:zentory_app/features/inventory/data/repositories/movement_repository_impl.dart'
    as _i587;
import 'package:zentory_app/features/inventory/domain/repositories/inventory_repository.dart'
    as _i71;
import 'package:zentory_app/features/inventory/domain/repositories/movement_repository.dart'
    as _i117;
import 'package:zentory_app/features/inventory/domain/usecases/add_product_usecase.dart'
    as _i957;
import 'package:zentory_app/features/inventory/domain/usecases/delete_product_usecase.dart'
    as _i565;
import 'package:zentory_app/features/inventory/domain/usecases/get_products_usecase.dart'
    as _i204;
import 'package:zentory_app/features/inventory/domain/usecases/movement_usecases.dart'
    as _i1055;
import 'package:zentory_app/features/inventory/domain/usecases/update_product_usecase.dart'
    as _i87;
import 'package:zentory_app/features/inventory/domain/usecases/upload_image_usecase.dart'
    as _i616;
import 'package:zentory_app/features/inventory/domain/usecases/watch_products_usecase.dart'
    as _i582;
import 'package:zentory_app/features/inventory/presentation/bloc/dashboard_bloc.dart'
    as _i184;
import 'package:zentory_app/features/inventory/presentation/bloc/inventory_bloc.dart'
    as _i932;
import 'package:zentory_app/features/inventory/presentation/bloc/movements_bloc.dart'
    as _i1030;
import 'package:zentory_app/features/settings/presentation/bloc/settings_bloc.dart'
    as _i661;
import 'package:zentory_app/features/workspaces/data/datasources/members_remote_data_source.dart'
    as _i658;
import 'package:zentory_app/features/workspaces/data/datasources/workspaces_remote_data_source.dart'
    as _i370;
import 'package:zentory_app/features/workspaces/data/repositories/members_repository_impl.dart'
    as _i90;
import 'package:zentory_app/features/workspaces/data/repositories/workspaces_repository_impl.dart'
    as _i524;
import 'package:zentory_app/features/workspaces/domain/repositories/members_repository.dart'
    as _i248;
import 'package:zentory_app/features/workspaces/domain/repositories/workspaces_repository.dart'
    as _i1063;
import 'package:zentory_app/features/workspaces/domain/usecases/get_workspaces_usecase.dart'
    as _i187;
import 'package:zentory_app/features/workspaces/domain/usecases/member_usecases.dart'
    as _i232;
import 'package:zentory_app/features/workspaces/presentation/bloc/members_bloc.dart'
    as _i7;
import 'package:zentory_app/features/workspaces/presentation/bloc/workspaces_bloc.dart'
    as _i117;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appwriteModule = _$AppwriteModule();
    final databaseModule = _$DatabaseModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => appwriteModule.prefs,
      preResolve: true,
    );
    await gh.factoryAsync<_i591.ObjectBoxDatabase>(
      () => databaseModule.objectBoxDatabase,
      preResolve: true,
    );
    gh.lazySingleton<_i317.Client>(() => appwriteModule.client);
    gh.lazySingleton<_i317.Account>(() => appwriteModule.account);
    gh.lazySingleton<_i317.Databases>(() => appwriteModule.databases);
    gh.lazySingleton<_i317.TablesDB>(() => appwriteModule.tablesDB);
    gh.lazySingleton<_i317.Storage>(() => appwriteModule.storage);
    gh.lazySingleton<_i317.Realtime>(() => appwriteModule.realtime);
    gh.lazySingleton<_i1034.ConnectivityBloc>(() => _i1034.ConnectivityBloc());
    gh.lazySingleton<_i67.InventoryLocalDataSource>(
        () => _i67.InventoryLocalDataSourceImpl(gh<_i591.ObjectBoxDatabase>()));
    gh.lazySingleton<_i442.MovementLocalDataSource>(
        () => _i442.MovementLocalDataSourceImpl(gh<_i591.ObjectBoxDatabase>()));
    gh.lazySingleton<_i982.AuthRemoteDataSource>(
        () => _i982.AuthRemoteDataSourceImpl(gh<_i317.Account>()));
    gh.lazySingleton<_i658.MembersRemoteDataSource>(
        () => _i658.MembersRemoteDataSourceImpl(gh<_i317.Account>()));
    gh.lazySingleton<_i909.InventoryRemoteDataSource>(
        () => _i909.InventoryRemoteDataSourceImpl(
              gh<_i317.TablesDB>(),
              gh<_i317.Storage>(),
              gh<_i317.Realtime>(),
            ));
    gh.lazySingleton<_i661.SettingsBloc>(
        () => _i661.SettingsBloc(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i595.MovementRemoteDataSource>(
        () => _i595.MovementRemoteDataSourceImpl(gh<_i317.TablesDB>()));
    gh.lazySingleton<_i117.MovementRepository>(
        () => _i587.MovementRepositoryImpl(
              gh<_i595.MovementRemoteDataSource>(),
              gh<_i442.MovementLocalDataSource>(),
            ));
    gh.lazySingleton<_i248.MembersRepository>(
        () => _i90.MembersRepositoryImpl(gh<_i658.MembersRemoteDataSource>()));
    gh.factory<_i232.GetMembersUseCase>(
        () => _i232.GetMembersUseCase(gh<_i248.MembersRepository>()));
    gh.factory<_i232.InviteMemberUseCase>(
        () => _i232.InviteMemberUseCase(gh<_i248.MembersRepository>()));
    gh.factory<_i232.RemoveMemberUseCase>(
        () => _i232.RemoveMemberUseCase(gh<_i248.MembersRepository>()));
    gh.factory<_i7.MembersBloc>(() => _i7.MembersBloc(
          gh<_i232.GetMembersUseCase>(),
          gh<_i232.InviteMemberUseCase>(),
          gh<_i232.RemoveMemberUseCase>(),
        ));
    gh.lazySingleton<_i71.InventoryRepository>(
        () => _i1061.InventoryRepositoryImpl(
              gh<_i909.InventoryRemoteDataSource>(),
              gh<_i67.InventoryLocalDataSource>(),
            ));
    gh.lazySingleton<_i1055.GetMovementsUseCase>(
        () => _i1055.GetMovementsUseCase(gh<_i117.MovementRepository>()));
    gh.lazySingleton<_i1055.RecordMovementUseCase>(
        () => _i1055.RecordMovementUseCase(gh<_i117.MovementRepository>()));
    gh.lazySingleton<_i370.WorkspacesRemoteDataSource>(
        () => _i370.WorkspacesRemoteDataSourceImpl(
              gh<_i317.TablesDB>(),
              gh<_i317.Account>(),
            ));
    gh.factory<_i582.WatchProductsUseCase>(
        () => _i582.WatchProductsUseCase(gh<_i71.InventoryRepository>()));
    gh.lazySingleton<_i957.AddProductUseCase>(
        () => _i957.AddProductUseCase(gh<_i71.InventoryRepository>()));
    gh.lazySingleton<_i565.DeleteProductUseCase>(
        () => _i565.DeleteProductUseCase(gh<_i71.InventoryRepository>()));
    gh.lazySingleton<_i204.GetProductsUseCase>(
        () => _i204.GetProductsUseCase(gh<_i71.InventoryRepository>()));
    gh.lazySingleton<_i87.UpdateProductUseCase>(
        () => _i87.UpdateProductUseCase(gh<_i71.InventoryRepository>()));
    gh.lazySingleton<_i397.AuthRepository>(
        () => _i449.AuthRepositoryImpl(gh<_i982.AuthRemoteDataSource>()));
    gh.factory<_i184.DashboardBloc>(() => _i184.DashboardBloc(
          gh<_i204.GetProductsUseCase>(),
          gh<_i1055.GetMovementsUseCase>(),
        ));
    gh.lazySingleton<_i1063.WorkspacesRepository>(() =>
        _i524.WorkspacesRepositoryImpl(gh<_i370.WorkspacesRemoteDataSource>()));
    gh.lazySingleton<_i31.SyncManager>(() => _i31.SyncManager(
          gh<_i1034.ConnectivityBloc>(),
          gh<_i67.InventoryLocalDataSource>(),
          gh<_i909.InventoryRemoteDataSource>(),
          gh<_i442.MovementLocalDataSource>(),
          gh<_i595.MovementRemoteDataSource>(),
        ));
    gh.factory<_i616.UploadImageUseCase>(
        () => _i616.UploadImageUseCase(gh<_i71.InventoryRepository>()));
    gh.factory<_i742.UpdateProfileUseCase>(
        () => _i742.UpdateProfileUseCase(gh<_i397.AuthRepository>()));
    gh.lazySingleton<_i375.GetCurrentUserUseCase>(
        () => _i375.GetCurrentUserUseCase(gh<_i397.AuthRepository>()));
    gh.lazySingleton<_i38.LoginUseCase>(
        () => _i38.LoginUseCase(gh<_i397.AuthRepository>()));
    gh.lazySingleton<_i85.LogoutUseCase>(
        () => _i85.LogoutUseCase(gh<_i397.AuthRepository>()));
    gh.lazySingleton<_i143.RegisterUseCase>(
        () => _i143.RegisterUseCase(gh<_i397.AuthRepository>()));
    gh.factory<_i434.UpdatePasswordUseCase>(
        () => _i434.UpdatePasswordUseCase(gh<_i397.AuthRepository>()));
    gh.factory<_i1030.MovementsBloc>(
        () => _i1030.MovementsBloc(gh<_i1055.GetMovementsUseCase>()));
    gh.factory<_i932.InventoryBloc>(() => _i932.InventoryBloc(
          gh<_i204.GetProductsUseCase>(),
          gh<_i957.AddProductUseCase>(),
          gh<_i87.UpdateProductUseCase>(),
          gh<_i565.DeleteProductUseCase>(),
          gh<_i1055.RecordMovementUseCase>(),
          gh<_i375.GetCurrentUserUseCase>(),
          gh<_i616.UploadImageUseCase>(),
          gh<_i582.WatchProductsUseCase>(),
        ));
    gh.lazySingleton<_i187.GetWorkspacesUseCase>(
        () => _i187.GetWorkspacesUseCase(gh<_i1063.WorkspacesRepository>()));
    gh.lazySingleton<_i475.AuthBloc>(() => _i475.AuthBloc(
          gh<_i38.LoginUseCase>(),
          gh<_i85.LogoutUseCase>(),
          gh<_i143.RegisterUseCase>(),
          gh<_i375.GetCurrentUserUseCase>(),
          gh<_i742.UpdateProfileUseCase>(),
          gh<_i434.UpdatePasswordUseCase>(),
        ));
    gh.factory<_i117.WorkspacesBloc>(() => _i117.WorkspacesBloc(
          gh<_i187.GetWorkspacesUseCase>(),
          gh<_i1063.WorkspacesRepository>(),
        ));
    return this;
  }
}

class _$AppwriteModule extends _i914.AppwriteModule {}

class _$DatabaseModule extends _i75.DatabaseModule {}
