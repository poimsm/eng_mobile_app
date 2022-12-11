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
  @JsonKey(name: 'is_favorite')
  bool? get isFavorite => throw _privateConstructorUsedError;
  List<Sentence> get sentences => throw _privateConstructorUsedError;
  List<String> get collocations => throw _privateConstructorUsedError;

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
  $Res call(
      {int id,
      String cover,
      String url,
      @JsonKey(name: 'is_favorite') bool? isFavorite,
      List<Sentence> sentences,
      List<String> collocations});
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
    Object? isFavorite = freezed,
    Object? sentences = null,
    Object? collocations = null,
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
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      sentences: null == sentences
          ? _value.sentences
          : sentences // ignore: cast_nullable_to_non_nullable
              as List<Sentence>,
      collocations: null == collocations
          ? _value.collocations
          : collocations // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
  $Res call(
      {int id,
      String cover,
      String url,
      @JsonKey(name: 'is_favorite') bool? isFavorite,
      List<Sentence> sentences,
      List<String> collocations});
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
    Object? isFavorite = freezed,
    Object? sentences = null,
    Object? collocations = null,
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
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      sentences: null == sentences
          ? _value._sentences
          : sentences // ignore: cast_nullable_to_non_nullable
              as List<Sentence>,
      collocations: null == collocations
          ? _value._collocations
          : collocations // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      @JsonKey(name: 'is_favorite') this.isFavorite,
      required final List<Sentence> sentences,
      required final List<String> collocations})
      : _sentences = sentences,
        _collocations = collocations;

  factory _$_ShortVideo.fromJson(Map<String, dynamic> json) =>
      _$$_ShortVideoFromJson(json);

  @override
  final int id;
  @override
  final String cover;
  @override
  final String url;
  @override
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;
  final List<Sentence> _sentences;
  @override
  List<Sentence> get sentences {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sentences);
  }

  final List<String> _collocations;
  @override
  List<String> get collocations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collocations);
  }

  @override
  String toString() {
    return 'ShortVideo(id: $id, cover: $cover, url: $url, isFavorite: $isFavorite, sentences: $sentences, collocations: $collocations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShortVideo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            const DeepCollectionEquality()
                .equals(other._sentences, _sentences) &&
            const DeepCollectionEquality()
                .equals(other._collocations, _collocations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      cover,
      url,
      isFavorite,
      const DeepCollectionEquality().hash(_sentences),
      const DeepCollectionEquality().hash(_collocations));

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
      @JsonKey(name: 'is_favorite') final bool? isFavorite,
      required final List<Sentence> sentences,
      required final List<String> collocations}) = _$_ShortVideo;

  factory _ShortVideo.fromJson(Map<String, dynamic> json) =
      _$_ShortVideo.fromJson;

  @override
  int get id;
  @override
  String get cover;
  @override
  String get url;
  @override
  @JsonKey(name: 'is_favorite')
  bool? get isFavorite;
  @override
  List<Sentence> get sentences;
  @override
  List<String> get collocations;
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
  @JsonKey(name: 'voice_url')
  String get voiceUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_favorite')
  bool? get isFavorite => throw _privateConstructorUsedError;
  List<Sentence> get sentences => throw _privateConstructorUsedError;
  List<String> get collocations => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'voice_url') String voiceUrl,
      @JsonKey(name: 'is_favorite') bool? isFavorite,
      List<Sentence> sentences,
      List<String> collocations});
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
    Object? voiceUrl = null,
    Object? isFavorite = freezed,
    Object? sentences = null,
    Object? collocations = null,
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
      voiceUrl: null == voiceUrl
          ? _value.voiceUrl
          : voiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      sentences: null == sentences
          ? _value.sentences
          : sentences // ignore: cast_nullable_to_non_nullable
              as List<Sentence>,
      collocations: null == collocations
          ? _value.collocations
          : collocations // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'voice_url') String voiceUrl,
      @JsonKey(name: 'is_favorite') bool? isFavorite,
      List<Sentence> sentences,
      List<String> collocations});
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
    Object? voiceUrl = null,
    Object? isFavorite = freezed,
    Object? sentences = null,
    Object? collocations = null,
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
      voiceUrl: null == voiceUrl
          ? _value.voiceUrl
          : voiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      sentences: null == sentences
          ? _value._sentences
          : sentences // ignore: cast_nullable_to_non_nullable
              as List<Sentence>,
      collocations: null == collocations
          ? _value._collocations
          : collocations // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'voice_url') required this.voiceUrl,
      @JsonKey(name: 'is_favorite') this.isFavorite,
      required final List<Sentence> sentences,
      required final List<String> collocations})
      : _sentences = sentences,
        _collocations = collocations;

  factory _$_InfoCard.fromJson(Map<String, dynamic> json) =>
      _$$_InfoCardFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @override
  @JsonKey(name: 'voice_url')
  final String voiceUrl;
  @override
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;
  final List<Sentence> _sentences;
  @override
  List<Sentence> get sentences {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sentences);
  }

  final List<String> _collocations;
  @override
  List<String> get collocations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collocations);
  }

  @override
  String toString() {
    return 'InfoCard(id: $id, imageUrl: $imageUrl, voiceUrl: $voiceUrl, isFavorite: $isFavorite, sentences: $sentences, collocations: $collocations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InfoCard &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.voiceUrl, voiceUrl) ||
                other.voiceUrl == voiceUrl) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            const DeepCollectionEquality()
                .equals(other._sentences, _sentences) &&
            const DeepCollectionEquality()
                .equals(other._collocations, _collocations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      imageUrl,
      voiceUrl,
      isFavorite,
      const DeepCollectionEquality().hash(_sentences),
      const DeepCollectionEquality().hash(_collocations));

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
      @JsonKey(name: 'voice_url') required final String voiceUrl,
      @JsonKey(name: 'is_favorite') final bool? isFavorite,
      required final List<Sentence> sentences,
      required final List<String> collocations}) = _$_InfoCard;

  factory _InfoCard.fromJson(Map<String, dynamic> json) = _$_InfoCard.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @override
  @JsonKey(name: 'voice_url')
  String get voiceUrl;
  @override
  @JsonKey(name: 'is_favorite')
  bool? get isFavorite;
  @override
  List<Sentence> get sentences;
  @override
  List<String> get collocations;
  @override
  @JsonKey(ignore: true)
  _$$_InfoCardCopyWith<_$_InfoCard> get copyWith =>
      throw _privateConstructorUsedError;
}

Favorite _$FavoriteFromJson(Map<String, dynamic> json) {
  return _Favorite.fromJson(json);
}

/// @nodoc
mixin _$Favorite {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_type')
  int get sourceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'info_card')
  int? get infoCard => throw _privateConstructorUsedError;
  @JsonKey(name: 'short_video')
  int? get shortVideo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteCopyWith<Favorite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteCopyWith<$Res> {
  factory $FavoriteCopyWith(Favorite value, $Res Function(Favorite) then) =
      _$FavoriteCopyWithImpl<$Res, Favorite>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'source_type') int sourceType,
      @JsonKey(name: 'info_card') int? infoCard,
      @JsonKey(name: 'short_video') int? shortVideo});
}

/// @nodoc
class _$FavoriteCopyWithImpl<$Res, $Val extends Favorite>
    implements $FavoriteCopyWith<$Res> {
  _$FavoriteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? sourceType = null,
    Object? infoCard = freezed,
    Object? shortVideo = freezed,
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
      sourceType: null == sourceType
          ? _value.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as int,
      infoCard: freezed == infoCard
          ? _value.infoCard
          : infoCard // ignore: cast_nullable_to_non_nullable
              as int?,
      shortVideo: freezed == shortVideo
          ? _value.shortVideo
          : shortVideo // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavoriteCopyWith<$Res> implements $FavoriteCopyWith<$Res> {
  factory _$$_FavoriteCopyWith(
          _$_Favorite value, $Res Function(_$_Favorite) then) =
      __$$_FavoriteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'source_type') int sourceType,
      @JsonKey(name: 'info_card') int? infoCard,
      @JsonKey(name: 'short_video') int? shortVideo});
}

/// @nodoc
class __$$_FavoriteCopyWithImpl<$Res>
    extends _$FavoriteCopyWithImpl<$Res, _$_Favorite>
    implements _$$_FavoriteCopyWith<$Res> {
  __$$_FavoriteCopyWithImpl(
      _$_Favorite _value, $Res Function(_$_Favorite) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? sourceType = null,
    Object? infoCard = freezed,
    Object? shortVideo = freezed,
  }) {
    return _then(_$_Favorite(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      sourceType: null == sourceType
          ? _value.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as int,
      infoCard: freezed == infoCard
          ? _value.infoCard
          : infoCard // ignore: cast_nullable_to_non_nullable
              as int?,
      shortVideo: freezed == shortVideo
          ? _value.shortVideo
          : shortVideo // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Favorite implements _Favorite {
  const _$_Favorite(
      {required this.id,
      @JsonKey(name: 'image_url') required this.imageUrl,
      @JsonKey(name: 'source_type') required this.sourceType,
      @JsonKey(name: 'info_card') this.infoCard,
      @JsonKey(name: 'short_video') this.shortVideo});

  factory _$_Favorite.fromJson(Map<String, dynamic> json) =>
      _$$_FavoriteFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @override
  @JsonKey(name: 'source_type')
  final int sourceType;
  @override
  @JsonKey(name: 'info_card')
  final int? infoCard;
  @override
  @JsonKey(name: 'short_video')
  final int? shortVideo;

  @override
  String toString() {
    return 'Favorite(id: $id, imageUrl: $imageUrl, sourceType: $sourceType, infoCard: $infoCard, shortVideo: $shortVideo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Favorite &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.sourceType, sourceType) ||
                other.sourceType == sourceType) &&
            (identical(other.infoCard, infoCard) ||
                other.infoCard == infoCard) &&
            (identical(other.shortVideo, shortVideo) ||
                other.shortVideo == shortVideo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, imageUrl, sourceType, infoCard, shortVideo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoriteCopyWith<_$_Favorite> get copyWith =>
      __$$_FavoriteCopyWithImpl<_$_Favorite>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteToJson(
      this,
    );
  }
}

abstract class _Favorite implements Favorite {
  const factory _Favorite(
      {required final int id,
      @JsonKey(name: 'image_url') required final String imageUrl,
      @JsonKey(name: 'source_type') required final int sourceType,
      @JsonKey(name: 'info_card') final int? infoCard,
      @JsonKey(name: 'short_video') final int? shortVideo}) = _$_Favorite;

  factory _Favorite.fromJson(Map<String, dynamic> json) = _$_Favorite.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @override
  @JsonKey(name: 'source_type')
  int get sourceType;
  @override
  @JsonKey(name: 'info_card')
  int? get infoCard;
  @override
  @JsonKey(name: 'short_video')
  int? get shortVideo;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteCopyWith<_$_Favorite> get copyWith =>
      throw _privateConstructorUsedError;
}
