// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    @JsonKey(name: 'total_sentences') required int totalSentences,
    required String email,
    required bool verified,
    required bool screenFlow,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) =>
      _$UserFromJson(json);
}
