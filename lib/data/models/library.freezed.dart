// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'library.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShortVideo _$ShortVideoFromJson(Map<String, dynamic> json) {
  return _ShortVideo.fromJson(json);
}

/// @nodoc
mixin _$ShortVideo {
  int get id => throw _privateConstructorUsedError;
  String get cover => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  List<Word> get words => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShortVideoCopyWith<ShortVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShortVideoCopyWith<$Res> {
  factory $ShortVideoCopyWith(
          ShortVideo value, $Res Function(ShortVideo) then) =
      _$ShortVideoCopyWithImpl<$Res, ShortVideo>;
  @useResult
  $Res call({int id, String cover, String url, List<Word> words});
}

/// @nodoc
class _$ShortVideoCopyWithImpl<$Res, $Val extends ShortVideo>
    implements $ShortVideoCopyWith<$Res> {
  _$ShortVideoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cover = null,
    Object? url = null,
    Object? words = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      words: null == words
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<Word>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShortVideoCopyWith<$Res>
    implements $ShortVideoCopyWith<$Res> {
  factory _$$_ShortVideoCopyWith(
          _$_ShortVideo value, $Res Function(_$_ShortVideo) then) =
      __$$_ShortVideoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String cover, String url, List<Word> words});
}

/// @nodoc
class __$$_ShortVideoCopyWithImpl<$Res>
    extends _$ShortVideoCopyWithImpl<$Res, _$_ShortVideo>
    implements _$$_ShortVideoCopyWith<$Res> {
  __$$_ShortVideoCopyWithImpl(
      _$_ShortVideo _value, $Res Function(_$_ShortVideo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cover = null,
    Object? url = null,
    Object? words = null,
  }) {
    return _then(_$_ShortVideo(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      words: null == words
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<Word>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShortVideo implements _ShortVideo {
  const _$_ShortVideo(
      {required this.id,
      required this.cover,
      required this.url,
      required final List<Word> words})
      : _words = words;

  factory _$_ShortVideo.fromJson(Map<String, dynamic> json) =>
      _$$_ShortVideoFromJson(json);

  @override
  final int id;
  @override
  final String cover;
  @override
  final String url;
  final List<Word> _words;
  @override
  List<Word> get words {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  @override
  String toString() {
    return 'ShortVideo(id: $id, cover: $cover, url: $url, words: $words)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShortVideo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other._words, _words));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, cover, url, const DeepCollectionEquality().hash(_words));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShortVideoCopyWith<_$_ShortVideo> get copyWith =>
      __$$_ShortVideoCopyWithImpl<_$_ShortVideo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShortVideoToJson(
      this,
    );
  }
}

abstract class _ShortVideo implements ShortVideo {
  const factory _ShortVideo(
      {required final int id,
      required final String cover,
      required final String url,
      required final List<Word> words}) = _$_ShortVideo;

  factory _ShortVideo.fromJson(Map<String, dynamic> json) =
      _$_ShortVideo.fromJson;

  @override
  int get id;
  @override
  String get cover;
  @override
  String get url;
  @override
  List<Word> get words;
  @override
  @JsonKey(ignore: true)
  _$$_ShortVideoCopyWith<_$_ShortVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

InfoCard _$InfoCardFromJson(Map<String, dynamic> json) {
  return _InfoCard.fromJson(json);
}

/// @nodoc
mixin _$InfoCard {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'audio_url')
  String get audioUrl => throw _privateConstructorUsedError;
  bool get saved => throw _privateConstructorUsedError;
  List<Word> get words => throw _privateConstructorUsedError;
  List<String> get examples => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InfoCardCopyWith<InfoCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoCardCopyWith<$Res> {
  factory $InfoCardCopyWith(InfoCard value, $Res Function(InfoCard) then) =
      _$InfoCardCopyWithImpl<$Res, InfoCard>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'audio_url') String audioUrl,
      bool saved,
      List<Word> words,
      List<String> examples});
}

/// @nodoc
class _$InfoCardCopyWithImpl<$Res, $Val extends InfoCard>
    implements $InfoCardCopyWith<$Res> {
  _$InfoCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? audioUrl = null,
    Object? saved = null,
    Object? words = null,
    Object? examples = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      audioUrl: null == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String,
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
      words: null == words
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<Word>,
      examples: null == examples
          ? _value.examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InfoCardCopyWith<$Res> implements $InfoCardCopyWith<$Res> {
  factory _$$_InfoCardCopyWith(
          _$_InfoCard value, $Res Function(_$_InfoCard) then) =
      __$$_InfoCardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'audio_url') String audioUrl,
      bool saved,
      List<Word> words,
      List<String> examples});
}

/// @nodoc
class __$$_InfoCardCopyWithImpl<$Res>
    extends _$InfoCardCopyWithImpl<$Res, _$_InfoCard>
    implements _$$_InfoCardCopyWith<$Res> {
  __$$_InfoCardCopyWithImpl(
      _$_InfoCard _value, $Res Function(_$_InfoCard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? audioUrl = null,
    Object? saved = null,
    Object? words = null,
    Object? examples = null,
  }) {
    return _then(_$_InfoCard(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      audioUrl: null == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String,
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
      words: null == words
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<Word>,
      examples: null == examples
          ? _value._examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InfoCard implements _InfoCard {
  const _$_InfoCard(
      {required this.id,
      @JsonKey(name: 'image_url') required this.imageUrl,
      @JsonKey(name: 'audio_url') required this.audioUrl,
      required this.saved,
      required final List<Word> words,
      required final List<String> examples})
      : _words = words,
        _examples = examples;

  factory _$_InfoCard.fromJson(Map<String, dynamic> json) =>
      _$$_InfoCardFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @override
  @JsonKey(name: 'audio_url')
  final String audioUrl;
  @override
  final bool saved;
  final List<Word> _words;
  @override
  List<Word> get words {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  final List<String> _examples;
  @override
  List<String> get examples {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_examples);
  }

  @override
  String toString() {
    return 'InfoCard(id: $id, imageUrl: $imageUrl, audioUrl: $audioUrl, saved: $saved, words: $words, examples: $examples)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InfoCard &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl) &&
            (identical(other.saved, saved) || other.saved == saved) &&
            const DeepCollectionEquality().equals(other._words, _words) &&
            const DeepCollectionEquality().equals(other._examples, _examples));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      imageUrl,
      audioUrl,
      saved,
      const DeepCollectionEquality().hash(_words),
      const DeepCollectionEquality().hash(_examples));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InfoCardCopyWith<_$_InfoCard> get copyWith =>
      __$$_InfoCardCopyWithImpl<_$_InfoCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InfoCardToJson(
      this,
    );
  }
}

abstract class _InfoCard implements InfoCard {
  const factory _InfoCard(
      {required final int id,
      @JsonKey(name: 'image_url') required final String imageUrl,
      @JsonKey(name: 'audio_url') required final String audioUrl,
      required final bool saved,
      required final List<Word> words,
      required final List<String> examples}) = _$_InfoCard;

  factory _InfoCard.fromJson(Map<String, dynamic> json) = _$_InfoCard.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @override
  @JsonKey(name: 'audio_url')
  String get audioUrl;
  @override
  bool get saved;
  @override
  List<Word> get words;
  @override
  List<String> get examples;
  @override
  @JsonKey(ignore: true)
  _$$_InfoCardCopyWith<_$_InfoCard> get copyWith =>
      throw _privateConstructorUsedError;
}