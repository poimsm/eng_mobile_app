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
      saved: json['saved'] as bool?,
      words: (json['words'] as List<dynamic>)
          .map((e) => Word.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ShortVideoToJson(_$_ShortVideo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cover': instance.cover,
      'url': instance.url,
      'saved': instance.saved,
      'words': instance.words,
    };

_$_InfoCard _$$_InfoCardFromJson(Map<String, dynamic> json) => _$_InfoCard(
      id: json['id'] as int,
      imageUrl: json['image_url'] as String,
      voiceUrl: json['voice_url'] as String,
      saved: json['saved'] as bool?,
      words: (json['words'] as List<dynamic>)
          .map((e) => Word.fromJson(e as Map<String, dynamic>))
          .toList(),
      collocations: (json['collocations'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_InfoCardToJson(_$_InfoCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.imageUrl,
      'voice_url': instance.voiceUrl,
      'saved': instance.saved,
      'words': instance.words,
      'collocations': instance.collocations,
    };
