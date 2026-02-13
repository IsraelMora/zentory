import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/core/error/failures.dart';
import 'package:zentory_app/data/datasources/members_remote_data_source.dart';
import 'package:zentory_app/domain/entities/member.dart';
import 'package:zentory_app/domain/repositories/members_repository.dart';

@LazySingleton(as: MembersRepository)
class MembersRepositoryImpl implements MembersRepository {
  final MembersRemoteDataSource _remoteDataSource;

  MembersRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<MemberEntity>>> getMembers(
    String workspaceId,
  ) async {
    try {
      final members = await _remoteDataSource.getMembers(workspaceId);
      return Right(members);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> inviteMember({
    required String workspaceId,
    required String email,
    required String role,
  }) async {
    try {
      await _remoteDataSource.inviteMember(
        workspaceId: workspaceId,
        email: email,
        role: role,
      );
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeMember({
    required String workspaceId,
    required String memberId,
  }) async {
    try {
      await _remoteDataSource.removeMember(
        workspaceId: workspaceId,
        memberId: memberId,
      );
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
