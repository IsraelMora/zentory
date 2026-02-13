import 'package:appwrite/appwrite.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/core/config/app_config.dart';
import 'package:zentory_app/common/utils/logger.dart';
import 'package:zentory_app/domain/entities/workspace.dart';

abstract class WorkspacesRemoteDataSource {
  Future<List<WorkspaceEntity>> getWorkspaces();
  Future<WorkspaceEntity> createWorkspace(String name);
}

@LazySingleton(as: WorkspacesRemoteDataSource)
class WorkspacesRemoteDataSourceImpl implements WorkspacesRemoteDataSource {
  final TablesDB _tablesDB;
  final Account _account;

  WorkspacesRemoteDataSourceImpl(this._tablesDB, this._account);

  @override
  Future<List<WorkspaceEntity>> getWorkspaces() async {
    try {
      ZentoryLogger.debug('Obteniendo espacios de trabajo...');
      final response = await _tablesDB.listRows(
        databaseId: AppConfig.appwriteDatabaseId,
        tableId: AppConfig.workspacesCollectionId,
      );
      ZentoryLogger.debug(
          'Respuesta de Appwrite: ${response.rows.length} espacios encontrados');

      return response.rows
          .map(
            (doc) => WorkspaceEntity(
              id: doc.$id,
              name: doc.data['name'] ?? 'Espacio sin nombre',
              ownerId: doc.data['ownerId'] ?? '',
              memberIds: List<String>.from(doc.data['memberIds'] ?? []),
            ),
          )
          .toList();
    } catch (e, stackTrace) {
      ZentoryLogger.error(
          'Error al obtener espacios de trabajo', e, stackTrace);
      throw Exception('Error al obtener espacios de trabajo: $e');
    }
  }

  @override
  Future<WorkspaceEntity> createWorkspace(String name) async {
    try {
      ZentoryLogger.info('Iniciando creación de espacio: $name');
      final user = await _account.get();
      ZentoryLogger.debug('Usuario actual: ${user.$id}');

      final response = await _tablesDB.createRow(
        databaseId: AppConfig.appwriteDatabaseId,
        tableId: AppConfig.workspacesCollectionId,
        rowId: ID.unique(),
        data: {
          'name': name,
          'ownerId': user.$id,
          'memberIds': [user.$id],
          'createdDate': DateTime.now().toIso8601String(),
          'isActive': true,
          'description': '',
        },
      );

      ZentoryLogger.info(
          'Espacio creado con éxito en Appwrite: ${response.$id}');

      return WorkspaceEntity(
        id: response.$id,
        name: response.data['name'],
        ownerId: response.data['ownerId'],
        memberIds: List<String>.from(response.data['memberIds'] ?? [user.$id]),
      );
    } catch (e, stackTrace) {
      ZentoryLogger.error(
          'Error al crear espacio de trabajo en Appwrite', e, stackTrace);
      throw Exception('Error al crear espacio de trabajo: $e');
    }
  }
}
