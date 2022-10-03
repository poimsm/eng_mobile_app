// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Activity _$$_ActivityFromJson(Map<String, dynamic> json) => _$_Activity(
      type: json['type'] as String,
      question: json['question'] == null
          ? null
          : Question.fromJson(json['question'] as Map<String, dynamic>),
      word: json['word'] == null
          ? null
          : Word.fromJson(json['word'] as Map<String, dynamic>),
      imageActivity: json['image'] == null
          ? null
          : ImageActivity.fromJson(json['image'] as Map<String, dynamic>),
      style: Style.fromJson(json['style'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ActivityToJson(_$_Activity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'question': instance.question,
      'word': instance.word,
      'image': instance.imageActivity,
      'style': instance.style,
    };

_$_Word _$$_WordFromJson(Map<String, dynamic> json) => _$_Word(
      id: json['id'] as int,
      word: json['sentence'] as String,
      meaning: json['meaning'] as String?,
    );

Map<String, dynamic> _$$_WordToJson(_$_Word instance) => <String, dynamic>{
      'id': instance.id,
      'sentence': instance.word,
      'meaning': instance.meaning,
    };

_$_Style _$$_StyleFromJson(Map<String, dynamic> json) => _$_Style(
      backgroundScreen: json['background_screen'] as String,
      backgroundWord: json['background_word'] as String,
    );

Map<String, dynamic> _$$_StyleToJson(_$_Style instance) => <String, dynamic>{
      'background_screen': instance.backgroundScreen,
      'background_word': instance.backgroundWord,
    };

_$_ImageActivity _$$_ImageActivityFromJson(Map<String, dynamic> json) =>
    _$_ImageActivity(
      id: json['id'] as int,
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$$_ImageActivityToJson(_$_ImageActivity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.imageUrl,
    };

_$_Question _$$_QuestionFromJson(Map<String, dynamic> json) => _$_Question(
      id: json['id'] as int,
      imageUrl: json['image_url'] as String,
      voiceUrl: json['voice_url'] as String,
      question: json['question'] as String,
    );

Map<String, dynamic> _$$_QuestionToJson(_$_Question instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.imageUrl,
      'voice_url': instance.voiceUrl,
      'question': instance.question,
    };
