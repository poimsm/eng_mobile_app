// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      email: json['email'] as String,
      verified: json['verified'] as bool,
      screenFlow: json['screen_flow'] as bool,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'verified': instance.verified,
      'screen_flow': instance.screenFlow,
    };

_$_UserStats _$$_UserStatsFromJson(Map<String, dynamic> json) => _$_UserStats(
      id: json['id'] as int,
      totalSentences: json['total_sentences'] as int,
      totalVideos: json['total_videos'] as int,
      totalCards: json['total_cards'] as int,
    );

Map<String, dynamic> _$$_UserStatsToJson(_$_UserStats instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total_sentences': instance.totalSentences,
      'total_videos': instance.totalVideos,
      'total_cards': instance.totalCards,
    };
