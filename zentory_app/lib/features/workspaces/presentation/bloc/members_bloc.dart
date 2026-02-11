import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/features/workspaces/domain/entities/member.dart';
import 'package:zentory_app/features/workspaces/domain/usecases/member_usecases.dart';

part 'members_event.dart';
part 'members_state.dart';
part 'members_bloc.freezed.dart';

@injectable
class MembersBloc extends Bloc<MembersEvent, MembersState> {
  final GetMembersUseCase _getMembersUseCase;
  final InviteMemberUseCase _inviteMemberUseCase;
  final RemoveMemberUseCase _removeMemberUseCase;

  MembersBloc(
    this._getMembersUseCase,
    this._inviteMemberUseCase,
    this._removeMemberUseCase,
  ) : super(const MembersState.initial()) {
    on<_MembersFetched>((event, emit) async {
      emit(const MembersState.loading());
      final result = await _getMembersUseCase(event.workspaceId);
      result.fold(
        (failure) => emit(MembersState.error(failure.toString())),
        (members) => emit(MembersState.loaded(members)),
      );
    });

    on<_MemberInvited>((event, emit) async {
      final result = await _inviteMemberUseCase(
        workspaceId: event.workspaceId,
        email: event.email,
        role: event.role,
      );
      result.fold(
        (failure) => emit(MembersState.error(failure.toString())),
        (_) => add(MembersEvent.membersFetched(event.workspaceId)),
      );
    });

    on<_MemberRemoved>((event, emit) async {
      final result = await _removeMemberUseCase(
        workspaceId: event.workspaceId,
        memberId: event.memberId,
      );
      result.fold(
        (failure) => emit(MembersState.error(failure.toString())),
        (_) => add(MembersEvent.membersFetched(event.workspaceId)),
      );
    });
  }
}
