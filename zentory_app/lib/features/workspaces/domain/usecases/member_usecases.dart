import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/core/error/failures.dart';
import 'package:zentory_app/features/workspaces/domain/entities/member.dart';
import 'package:zentory_app/features/workspaces/domain/repositories/members_repository.dart';

@injectable
class GetMembersUseCase {
  final MembersRepository repository;
  GetMembersUseCase(this.repository);

  Future<Either<Failure, List<MemberEntity>>> call(String workspaceId) {
    return repository.getMembers(workspaceId);
  }
}

@injectable
class InviteMemberUseCase {
  final MembersRepository repository;
  InviteMemberUseCase(this.repository);

  Future<Either<Failure, Unit>> call({
    required String workspaceId,
    required String email,
    required String role,
  }) {
    return repository.inviteMember(
      workspaceId: workspaceId,
      email: email,
      role: role,
    );
  }
}

@injectable
class RemoveMemberUseCase {
  final MembersRepository repository;
  RemoveMemberUseCase(this.repository);

  Future<Either<Failure, Unit>> call({
    required String workspaceId,
    required String memberId,
  }) {
    return repository.removeMember(
      workspaceId: workspaceId,
      memberId: memberId,
    );
  }
}
