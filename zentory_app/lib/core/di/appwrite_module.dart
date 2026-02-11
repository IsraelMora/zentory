import 'package:appwrite/appwrite.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zentory_app/core/config/app_config.dart';

@module
abstract class AppwriteModule {
  @lazySingleton
  Client get client {
    final client = Client();
    client
        .setEndpoint(AppConfig.appwriteEndpoint)
        .setProject(AppConfig.appwriteProjectId)
        .setSelfSigned(status: true);
    return client;
  }

  @lazySingleton
  Account get account => Account(client);

  @lazySingleton
  Databases get databases => Databases(client);

  @lazySingleton
  TablesDB get tablesDB => TablesDB(client);

  @lazySingleton
  Storage get storage => Storage(client);

  @lazySingleton
  Realtime get realtime => Realtime(client);

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
