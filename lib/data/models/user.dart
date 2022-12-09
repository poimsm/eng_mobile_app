// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String email,
    required bool verified,
    @JsonKey(name: 'screen_flow') required bool screenFlow,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) =>
      _$UserFromJson(json);
}

@freezed
class UserStats with _$UserStats {
  const factory UserStats({
    required int id,
    @JsonKey(name: 'total_sentences') required int totalSentences,
    @JsonKey(name: 'total_videos') required int totalVideos,
    @JsonKey(name: 'total_cards') required int totalCards,
  }) = _UserStats;

  factory UserStats.fromJson(Map<String, Object?> json) =>
      _$UserStatsFromJson(json);
}
