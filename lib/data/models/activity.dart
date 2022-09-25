// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

@freezed
class Activity with _$Activity {
  const factory Activity({
    required String type,
    Question? question,
    Word? word,
    @JsonKey(name: 'image_activity') ImageActivity? imageActivity,
    required Design design,
  }) = _Activity;

  factory Activity.fromJson(Map<String, Object?> json) =>
      _$ActivityFromJson(json);
}

@freezed
class Word with _$Word {
  const factory Word({
    required int id,
    required String word,
    String? meaning,
  }) = _Word;

  factory Word.fromJson(Map<String, Object?> json) => _$WordFromJson(json);
}

@freezed
class Design with _$Design {
  const factory Design({
    @JsonKey(name: 'background_color') required String backgroundColor,
    @JsonKey(name: 'word_background_color') required String wordBackgroundColor,
  }) = _Design;

  factory Design.fromJson(Map<String, Object?> json) => _$DesignFromJson(json);
}

@freezed
class ImageActivity with _$ImageActivity {
  const factory ImageActivity(
      {required int id,
      @JsonKey(name: 'image_url') required String imageUrl}) = _ImageActivity;

  factory ImageActivity.fromJson(Map<String, Object?> json) =>
      _$ImageActivityFromJson(json);
}

@freezed
class Question with _$Question {
  const factory Question(
      {required int id,
      @JsonKey(name: 'image_url') required String imageUrl,
      required String question}) = _Question;

  factory Question.fromJson(Map<String, Object?> json) =>
      _$QuestionFromJson(json);
}
