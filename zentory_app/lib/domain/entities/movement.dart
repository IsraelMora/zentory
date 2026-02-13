import 'package:freezed_annotation/freezed_annotation.dart';

part 'movement.freezed.dart';
part 'movement.g.dart';

enum MovementType {
  @JsonValue('in')
  inflow,
  @JsonValue('out')
  outflow,
  @JsonValue('adjustment')
  adjustment,
}

@freezed
abstract class MovementEntity with _$MovementEntity {
  const factory MovementEntity({
    required String id,
    required String productId,
    required String productName,
    required String workspaceId,
    required MovementType type,
    required int quantity,
    required String reason,
    required DateTime createdAt,
    required String userId,
    String? userName,
  }) = _MovementEntity;

  factory MovementEntity.fromJson(Map<String, dynamic> json) =>
      _$MovementEntityFromJson(json);
}
