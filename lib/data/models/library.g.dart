// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShortVideo _$$_ShortVideoFromJson(Map<String, dynamic> json) =>
    _$_ShortVideo(
      id: json['id'] as int,
      cover: json['cover'] as String,
      url: json['url'] as String,
      words: (json['words'] as List<dynamic>)
          .map((e) => Word.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ShortVideoToJson(_$_ShortVideo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cover': instance.cover,
      'url': instance.url,
      'words': instance.words,
    };

_$_InfoCard _$$_InfoCardFromJson(Map<String, dynamic> json) => _$_InfoCard(
      id: json['id'] as int,
      imageUrl: json['image_url'] as String,
      audioUrl: json['audio_url'] as String,
      saved: json['saved'] as bool,
      words: (json['words'] as List<dynamic>)
          .map((e) => Word.fromJson(e as Map<String, dynamic>))
          .toList(),
      examples:
          (json['examples'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_InfoCardToJson(_$_InfoCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.imageUrl,
      'audio_url': instance.audioUrl,
      'saved': instance.saved,
      'words': instance.words,
      'examples': instance.examples,
    };