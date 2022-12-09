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
      isFavorite: json['is_favorite'] as bool?,
      sentences: (json['sentences'] as List<dynamic>)
          .map((e) => Sentence.fromJson(e as Map<String, dynamic>))
          .toList(),
      collocations: (json['collocations'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_ShortVideoToJson(_$_ShortVideo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cover': instance.cover,
      'url': instance.url,
      'is_favorite': instance.isFavorite,
      'sentences': instance.sentences,
      'collocations': instance.collocations,
    };

_$_InfoCard _$$_InfoCardFromJson(Map<String, dynamic> json) => _$_InfoCard(
      id: json['id'] as int,
      imageUrl: json['image_url'] as String,
      voiceUrl: json['voice_url'] as String,
      isFavorite: json['is_favorite'] as bool?,
      sentences: (json['sentences'] as List<dynamic>)
          .map((e) => Sentence.fromJson(e as Map<String, dynamic>))
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
      'is_favorite': instance.isFavorite,
      'sentences': instance.sentences,
      'collocations': instance.collocations,
    };

_$_Favorite _$$_FavoriteFromJson(Map<String, dynamic> json) => _$_Favorite(
      id: json['id'] as int,
      imageUrl: json['image_url'] as String,
      sourceType: json['source_type'] as int,
    );

Map<String, dynamic> _$$_FavoriteToJson(_$_Favorite instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.imageUrl,
      'source_type': instance.sourceType,
    };
