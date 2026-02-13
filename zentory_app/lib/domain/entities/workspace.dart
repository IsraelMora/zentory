import 'package:freezed_annotation/freezed_annotation.dart';

part 'workspace.freezed.dart';

@freezed
abstract class WorkspaceEntity with _$WorkspaceEntity {
  const factory WorkspaceEntity({
    required String id,
    required String name,
    required String ownerId,
    @Default([]) List<String> memberIds,
  }) = _WorkspaceEntity;
}
