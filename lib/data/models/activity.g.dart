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
      imageActivity: json['image_activity'] == null
          ? null
          : ImageActivity.fromJson(
              json['image_activity'] as Map<String, dynamic>),
      design: Design.fromJson(json['design'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ActivityToJson(_$_Activity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'question': instance.question,
      'word': instance.word,
      'image_activity': instance.imageActivity,
      'design': instance.design,
    };

_$_Word _$$_WordFromJson(Map<String, dynamic> json) => _$_Word(
      id: json['id'] as int,
      word: json['word'] as String,
      meaning: json['meaning'] as String?,
    );

Map<String, dynamic> _$$_WordToJson(_$_Word instance) => <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'meaning': instance.meaning,
    };

_$_Design _$$_DesignFromJson(Map<String, dynamic> json) => _$_Design(
      backgroundColor: json['background_color'] as String,
      wordBackgroundColor: json['word_background_color'] as String,
    );

Map<String, dynamic> _$$_DesignToJson(_$_Design instance) => <String, dynamic>{
      'background_color': instance.backgroundColor,
      'word_background_color': instance.wordBackgroundColor,
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
      question: json['question'] as String,
    );

Map<String, dynamic> _$$_QuestionToJson(_$_Question instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.imageUrl,
      'question': instance.question,
    };
