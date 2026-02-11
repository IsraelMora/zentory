import 'package:injectable/injectable.dart';
import 'package:zentory_app/core/database/objectbox_database.dart';

@module
abstract class DatabaseModule {
  @preResolve
  Future<ObjectBoxDatabase> get objectBoxDatabase => ObjectBoxDatabase.create();
}
