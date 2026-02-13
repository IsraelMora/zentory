import 'package:appwrite/appwrite.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/common/utils/logger.dart';
import 'package:zentory_app/features/workspaces/domain/entities/member.dart';

abstract class MembersRemoteDataSource {
  Future<List<MemberEntity>> getMembers(String workspaceId);
  Future<void> inviteMember({
    required String workspaceId,
    required String email,
    required String role,
  });
  Future<void> removeMember({
    required String workspaceId,
    required String memberId,
  });
}

@LazySingleton(as: MembersRemoteDataSource)
class MembersRemoteDataSourceImpl implements MembersRemoteDataSource {
  final Account _account;

  MembersRemoteDataSourceImpl(this._account);

  @override
  Future<List<MemberEntity>> getMembers(String workspaceId) async {
    try {
      ZentoryLogger.debug(
          'Obteniendo miembros (Mock) para workspace: $workspaceId');
      // Since Teams is removed, we return the current user as the only member for now
      final user = await _account.get();

      return [
        MemberEntity(
          id: user.$id,
          name: user.name,
          email: user.email,
          role: 'Propietario',
          joinedAt: DateTime.parse(user.registration),
        ),
      ];
    } on AppwriteException catch (e) {
      ZentoryLogger.error('Error de Appwrite al obtener miembros', e);
      throw Exception('Error al obtener miembros: ${e.message}');
    } catch (e) {
      ZentoryLogger.error('Error inesperado al obtener miembros', e);
      throw Exception('Error al obtener miembros: $e');
    }
  }

  @override
  Future<void> inviteMember({
    required String workspaceId,
    required String email,
    required String role,
  }) async {
    ZentoryLogger.info('Mock: Invitando a $email con rol $role');
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> removeMember({
    required String workspaceId,
    required String memberId,
  }) async {
    ZentoryLogger.info('Mock: Eliminando miembro $memberId');
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
