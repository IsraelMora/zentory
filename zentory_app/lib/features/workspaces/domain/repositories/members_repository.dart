import 'package:dartz/dartz.dart';
import 'package:zentory_app/core/error/failures.dart';
import 'package:zentory_app/features/workspaces/domain/entities/member.dart';

abstract class MembersRepository {
  Future<Either<Failure, List<MemberEntity>>> getMembers(String workspaceId);
  Future<Either<Failure, Unit>> inviteMember({
    required String workspaceId,
    required String email,
    required String role,
  });
  Future<Either<Failure, Unit>> removeMember({
    required String workspaceId,
    required String memberId,
  });
}
