// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Activity _$$_ActivityFromJson(Map<String, dynamic> json) => _$_Activity(
      question: Question.fromJson(json['question'] as Map<String, dynamic>),
      word: json['word'] == null
          ? null
          : Word.fromJson(json['word'] as Map<String, dynamic>),
      example: json['example'] == null
          ? null
          : Example.fromJson(json['example'] as Map<String, dynamic>),
      style: Style.fromJson(json['style'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ActivityToJson(_$_Activity instance) =>
    <String, dynamic>{
      'question': instance.question,
      'word': instance.word,
      'example': instance.example,
      'style': instance.style,
    };

_$_Word _$$_WordFromJson(Map<String, dynamic> json) => _$_Word(
      id: json['id'] as int,
      word: json['sentence'] as String,
      origin: json['origin'] as int,
      type: json['type'] as int,
      meaning: json['meaning'] as String?,
      saved: json['saved'] == null ? false : savedFromJson(json['saved']),
      extras: json['extras'] as String?,
      sourceType: json['source_type'] as int?,
      infoCard: json['info_card'] == null
          ? null
          : InfoCard.fromJson(json['info_card'] as Map<String, dynamic>),
      shortVideo: json['short_video'] == null
          ? null
          : ShortVideo.fromJson(json['short_video'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WordToJson(_$_Word instance) => <String, dynamic>{
      'id': instance.id,
      'sentence': instance.word,
      'origin': instance.origin,
      'type': instance.type,
      'meaning': instance.meaning,
      'saved': instance.saved,
      'extras': instance.extras,
      'source_type': instance.sourceType,
      'info_card': instance.infoCard,
      'short_video': instance.shortVideo,
    };

_$_LocalWord _$$_LocalWordFromJson(Map<String, dynamic> json) => _$_LocalWord(
      id: json['id'] as int,
      word: json['sentence'] as String,
      origin: json['origin'] as int,
      type: json['type'] as int,
      meaning: json['meaning'] as String?,
      saved: json['saved'] == null ? false : savedFromJson(json['saved']),
      extras: json['extras'] as String?,
      sourceType: json['source_type'] as int?,
      infoCard: json['info_card'] as int?,
      shortVideo: json['short_video'] as int?,
    );

Map<String, dynamic> _$$_LocalWordToJson(_$_LocalWord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sentence': instance.word,
      'origin': instance.origin,
      'type': instance.type,
      'meaning': instance.meaning,
      'saved': instance.saved,
      'extras': instance.extras,
      'source_type': instance.sourceType,
      'info_card': instance.infoCard,
      'short_video': instance.shortVideo,
    };

_$_Example _$$_ExampleFromJson(Map<String, dynamic> json) => _$_Example(
      id: json['id'] as int,
      example: (json['example'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      voiceUrl: json['voice_url'] as String,
    );

Map<String, dynamic> _$$_ExampleToJson(_$_Example instance) =>
    <String, dynamic>{
      'id': instance.id,
      'example': instance.example,
      'voice_url': instance.voiceUrl,
    };

_$_Style _$$_StyleFromJson(Map<String, dynamic> json) => _$_Style(
      backgroundScreen: json['background_screen'] as String,
      backgroundChallenge: json['background_challenge'] as String,
      useGradient: json['use_gradient'] as bool,
      bottomGradientColor: json['bottom_gradient_color'] as String?,
      topGradientColor: json['top_gradient_color'] as String?,
      questionPosition: (json['question_position'] as num).toDouble(),
      imagePosition: (json['image_position'] as num).toDouble(),
      questionFontSize: (json['question_font_size'] as num).toDouble(),
      questionOpacity: (json['question_opacity'] as num).toDouble(),
    );

Map<String, dynamic> _$$_StyleToJson(_$_Style instance) => <String, dynamic>{
      'background_screen': instance.backgroundScreen,
      'background_challenge': instance.backgroundChallenge,
      'use_gradient': instance.useGradient,
      'bottom_gradient_color': instance.bottomGradientColor,
      'top_gradient_color': instance.topGradientColor,
      'question_position': instance.questionPosition,
      'image_position': instance.imagePosition,
      'question_font_size': instance.questionFontSize,
      'question_opacity': instance.questionOpacity,
    };

_$_Question _$$_QuestionFromJson(Map<String, dynamic> json) => _$_Question(
      id: json['id'] as int,
      type: json['type'] as int,
      imageUrl: json['image_url'] as String,
      voiceUrl: json['voice_url'] as String,
      question: json['question'] as String,
    );

Map<String, dynamic> _$$_QuestionToJson(_$_Question instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'image_url': instance.imageUrl,
      'voice_url': instance.voiceUrl,
      'question': instance.question,
    };
