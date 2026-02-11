part of 'members_bloc.dart';

@freezed
abstract class MembersEvent with _$MembersEvent {
  const factory MembersEvent.membersFetched(String workspaceId) =
      _MembersFetched;
  const factory MembersEvent.memberInvited({
    required String workspaceId,
    required String email,
    required String role,
  }) = _MemberInvited;
  const factory MembersEvent.memberRemoved({
    required String workspaceId,
    required String memberId,
  }) = _MemberRemoved;
}
