// ignore_for_file: invalid_annotation_target

import 'package:eng_mobile_app/data/models/library.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

@freezed
class Activity with _$Activity {
  const factory Activity({
    required Question question,
    Sentence? sentence,
    Example? example,
    required Style style,
  }) = _Activity;

  factory Activity.fromJson(Map<String, Object?> json) =>
      _$ActivityFromJson(json);
}

@freezed
class Sentence with _$Sentence {
  const factory Sentence({
    required int id,
    // @JsonKey(fromJson: User._addressFromJson,toJson: User._addressToJson) Address? address,
    @JsonKey(name: 'sentence') required String sentence,
    required int origin,
    required int type,
    String? meaning,
    // @Default(false) bool saved,
    @Default(false) @JsonKey(name: 'saved', fromJson: savedFromJson) bool saved,
    String? extras,
    @JsonKey(name: 'source_type') int? sourceType,
    @JsonKey(name: 'info_card') InfoCard? infoCard,
    @JsonKey(name: 'short_video') ShortVideo? shortVideo,
  }) = _Sentence;

  factory Sentence.fromJson(Map<String, Object?> json) => _$SentenceFromJson(json);
}

@freezed
class LocalSentence with _$LocalSentence {
  const factory LocalSentence({
    required int id,
    required String sentence,
    required int origin,
    required int type,
    String? meaning,
    @Default(false) @JsonKey(name: 'saved', fromJson: savedFromJson) bool saved,
    String? extras,
    @JsonKey(name: 'source_type') int? sourceType,
    @JsonKey(name: 'info_card') int? infoCard,
    @JsonKey(name: 'short_video') int? shortVideo,
  }) = _LocalSentence;

  factory LocalSentence.fromJson(Map<String, Object?> json) => _$LocalSentenceFromJson(json);
}

bool savedFromJson(val) {
  if (val is int) {
    return val == 0 ? false : true;
  }
  return val;
}

@freezed
class Example with _$Example {
  const factory Example({
    required int id,
    required List<Map> example,
    @JsonKey(name: 'voice_url') required String voiceUrl,
  }) = _Example;

  factory Example.fromJson(Map<String, Object?> json) =>
      _$ExampleFromJson(json);
}

@freezed
class Style with _$Style {
  const factory Style({
    @JsonKey(name: 'background_screen') required String backgroundScreen,
    @JsonKey(name: 'background_challenge') required String backgroundChallenge,
    @JsonKey(name: 'use_gradient') required bool useGradient,
    @JsonKey(name: 'bottom_gradient_color') String? bottomGradientColor,
    @JsonKey(name: 'top_gradient_color') String? topGradientColor,
    @JsonKey(name: 'question_position') required double questionPosition,
    @JsonKey(name: 'image_position') required double imagePosition,
    @JsonKey(name: 'question_font_size') required double questionFontSize,
    @JsonKey(name: 'question_opacity') required double questionOpacity,
  }) = _Style;

  factory Style.fromJson(Map<String, Object?> json) => _$StyleFromJson(json);
}

@freezed
class Question with _$Question {
  const factory Question(
      {required int id,
      required int type,
      @JsonKey(name: 'image_url') required String imageUrl,
      @JsonKey(name: 'voice_url') required String voiceUrl,
      required String question}) = _Question;

  factory Question.fromJson(Map<String, Object?> json) =>
      _$QuestionFromJson(json);
}
