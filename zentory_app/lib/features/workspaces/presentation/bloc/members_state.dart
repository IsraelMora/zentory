part of 'members_bloc.dart';

@freezed
class MembersState with _$MembersState {
  const factory MembersState.initial() = _Initial;
  const factory MembersState.loading() = _Loading;
  const factory MembersState.loaded(List<MemberEntity> members) = _Loaded;
  const factory MembersState.error(String message) = _Error;
}
