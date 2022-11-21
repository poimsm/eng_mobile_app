// ignore_for_file: invalid_annotation_target

import 'package:eng_mobile_app/data/models/activity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'library.freezed.dart';
part 'library.g.dart';

@freezed
class ShortVideo with _$ShortVideo {
  const factory ShortVideo({
    required int id,
    required String cover,
    required String url,
    bool? saved,
    required List<Word> words,
  }) = _ShortVideo;

  factory ShortVideo.fromJson(Map<String, Object?> json) =>
      _$ShortVideoFromJson(json);
}

@freezed
class InfoCard with _$InfoCard {
  const factory InfoCard({
    required int id,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'voice_url') required String voiceUrl,
    bool? saved,
    required List<Word> words,
    required List<String> collocations,
  }) = _InfoCard;

  factory InfoCard.fromJson(Map<String, Object?> json) =>
      _$InfoCardFromJson(json);
}
