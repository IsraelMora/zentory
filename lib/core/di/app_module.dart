import 'package:appwrite/appwrite.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast/sembast.dart' as sembast;
import 'package:path/path.dart';

import '../env/env.dart';

@module
abstract class AppModule {
  // Configuración de Appwrite
  @lazySingleton
  Client get appwriteClient => Client()
      .setEndpoint(Env.appwriteEndpoint)
      .setProject(Env.appwriteProjectId);

  @lazySingleton
  Account get appwriteAccount => Account(appwriteClient);

  @lazySingleton
  Databases get appwriteDatabases => Databases(appwriteClient);

  @lazySingleton
  Storage get appwriteStorage => Storage(appwriteClient);

  // Configuración de Sembast (Base de datos local)
  @preResolve
  @singleton
  Future<sembast.Database> get sembastDatabase async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, 'zentory.db');
    final databaseFactory = databaseFactoryIo;
    return databaseFactory.openDatabase(dbPath);
  }
}
