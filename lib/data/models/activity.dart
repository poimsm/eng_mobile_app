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
    @JsonKey(name: 'image') ImageActivity? imageActivity,
    required Style style,
  }) = _Activity;

  factory Activity.fromJson(Map<String, Object?> json) =>
      _$ActivityFromJson(json);
}

@freezed
class Word with _$Word {
  const factory Word({
    required int id,
    // @JsonKey(fromJson: User._addressFromJson,toJson: User._addressToJson) Address? address,
    @JsonKey(name: 'sentence') required String word,
    String? meaning,
  }) = _Word;

  factory Word.fromJson(Map<String, Object?> json) => _$WordFromJson(json);
}

@freezed
class Style with _$Style {
  const factory Style({
    @JsonKey(name: 'background_screen') required String backgroundScreen,
    @JsonKey(name: 'background_word') required String backgroundWord,
  }) = _Style;

  factory Style.fromJson(Map<String, Object?> json) => _$StyleFromJson(json);
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
      @JsonKey(name: 'voice_url') required String voiceUrl,
      required String question}) = _Question;

  factory Question.fromJson(Map<String, Object?> json) =>
      _$QuestionFromJson(json);
}
