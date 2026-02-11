// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovementEntity _$MovementEntityFromJson(Map<String, dynamic> json) =>
    _MovementEntity(
      id: json['id'] as String,
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      workspaceId: json['workspaceId'] as String,
      type: $enumDecode(_$MovementTypeEnumMap, json['type']),
      quantity: (json['quantity'] as num).toInt(),
      reason: json['reason'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      userId: json['userId'] as String,
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$MovementEntityToJson(_MovementEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'productName': instance.productName,
      'workspaceId': instance.workspaceId,
      'type': _$MovementTypeEnumMap[instance.type]!,
      'quantity': instance.quantity,
      'reason': instance.reason,
      'createdAt': instance.createdAt.toIso8601String(),
      'userId': instance.userId,
      'userName': instance.userName,
    };

const _$MovementTypeEnumMap = {
  MovementType.inflow: 'in',
  MovementType.outflow: 'out',
  MovementType.adjustment: 'adjustment',
};
