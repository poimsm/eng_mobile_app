// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      totalSentences: json['total_sentences'] as int,
      email: json['email'] as String,
      verified: json['verified'] as bool,
      screenFlow: json['screenFlow'] as bool,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'total_sentences': instance.totalSentences,
      'email': instance.email,
      'verified': instance.verified,
      'screenFlow': instance.screenFlow,
    };
