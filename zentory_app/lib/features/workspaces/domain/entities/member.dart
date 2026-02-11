import 'package:freezed_annotation/freezed_annotation.dart';

part 'member.freezed.dart';

@freezed
abstract class MemberEntity with _$MemberEntity {
  const factory MemberEntity({
    required String id,
    required String name,
    required String email,
    required String role,
    required DateTime joinedAt,
  }) = _MemberEntity;
}
