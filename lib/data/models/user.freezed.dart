// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;
  @JsonKey(name: 'screen_flow')
  bool get screenFlow => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int id,
      String email,
      bool verified,
      @JsonKey(name: 'screen_flow') bool screenFlow});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? verified = null,
    Object? screenFlow = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      screenFlow: null == screenFlow
          ? _value.screenFlow
          : screenFlow // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String email,
      bool verified,
      @JsonKey(name: 'screen_flow') bool screenFlow});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? verified = null,
    Object? screenFlow = null,
  }) {
    return _then(_$_User(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      screenFlow: null == screenFlow
          ? _value.screenFlow
          : screenFlow // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {required this.id,
      required this.email,
      required this.verified,
      @JsonKey(name: 'screen_flow') required this.screenFlow});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final bool verified;
  @override
  @JsonKey(name: 'screen_flow')
  final bool screenFlow;

  @override
  String toString() {
    return 'User(id: $id, email: $email, verified: $verified, screenFlow: $screenFlow)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.screenFlow, screenFlow) ||
                other.screenFlow == screenFlow));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, verified, screenFlow);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final int id,
      required final String email,
      required final bool verified,
      @JsonKey(name: 'screen_flow') required final bool screenFlow}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  bool get verified;
  @override
  @JsonKey(name: 'screen_flow')
  bool get screenFlow;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}

UserStats _$UserStatsFromJson(Map<String, dynamic> json) {
  return _UserStats.fromJson(json);
}

/// @nodoc
mixin _$UserStats {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_sentences')
  int get totalSentences => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_videos')
  int get totalVideos => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_cards')
  int get totalCards => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStatsCopyWith<UserStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatsCopyWith<$Res> {
  factory $UserStatsCopyWith(UserStats value, $Res Function(UserStats) then) =
      _$UserStatsCopyWithImpl<$Res, UserStats>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'total_sentences') int totalSentences,
      @JsonKey(name: 'total_videos') int totalVideos,
      @JsonKey(name: 'total_cards') int totalCards});
}

/// @nodoc
class _$UserStatsCopyWithImpl<$Res, $Val extends UserStats>
    implements $UserStatsCopyWith<$Res> {
  _$UserStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? totalSentences = null,
    Object? totalVideos = null,
    Object? totalCards = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      totalSentences: null == totalSentences
          ? _value.totalSentences
          : totalSentences // ignore: cast_nullable_to_non_nullable
              as int,
      totalVideos: null == totalVideos
          ? _value.totalVideos
          : totalVideos // ignore: cast_nullable_to_non_nullable
              as int,
      totalCards: null == totalCards
          ? _value.totalCards
          : totalCards // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserStatsCopyWith<$Res> implements $UserStatsCopyWith<$Res> {
  factory _$$_UserStatsCopyWith(
          _$_UserStats value, $Res Function(_$_UserStats) then) =
      __$$_UserStatsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'total_sentences') int totalSentences,
      @JsonKey(name: 'total_videos') int totalVideos,
      @JsonKey(name: 'total_cards') int totalCards});
}

/// @nodoc
class __$$_UserStatsCopyWithImpl<$Res>
    extends _$UserStatsCopyWithImpl<$Res, _$_UserStats>
    implements _$$_UserStatsCopyWith<$Res> {
  __$$_UserStatsCopyWithImpl(
      _$_UserStats _value, $Res Function(_$_UserStats) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? totalSentences = null,
    Object? totalVideos = null,
    Object? totalCards = null,
  }) {
    return _then(_$_UserStats(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      totalSentences: null == totalSentences
          ? _value.totalSentences
          : totalSentences // ignore: cast_nullable_to_non_nullable
              as int,
      totalVideos: null == totalVideos
          ? _value.totalVideos
          : totalVideos // ignore: cast_nullable_to_non_nullable
              as int,
      totalCards: null == totalCards
          ? _value.totalCards
          : totalCards // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserStats implements _UserStats {
  const _$_UserStats(
      {required this.id,
      @JsonKey(name: 'total_sentences') required this.totalSentences,
      @JsonKey(name: 'total_videos') required this.totalVideos,
      @JsonKey(name: 'total_cards') required this.totalCards});

  factory _$_UserStats.fromJson(Map<String, dynamic> json) =>
      _$$_UserStatsFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'total_sentences')
  final int totalSentences;
  @override
  @JsonKey(name: 'total_videos')
  final int totalVideos;
  @override
  @JsonKey(name: 'total_cards')
  final int totalCards;

  @override
  String toString() {
    return 'UserStats(id: $id, totalSentences: $totalSentences, totalVideos: $totalVideos, totalCards: $totalCards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserStats &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.totalSentences, totalSentences) ||
                other.totalSentences == totalSentences) &&
            (identical(other.totalVideos, totalVideos) ||
                other.totalVideos == totalVideos) &&
            (identical(other.totalCards, totalCards) ||
                other.totalCards == totalCards));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, totalSentences, totalVideos, totalCards);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserStatsCopyWith<_$_UserStats> get copyWith =>
      __$$_UserStatsCopyWithImpl<_$_UserStats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserStatsToJson(
      this,
    );
  }
}

abstract class _UserStats implements UserStats {
  const factory _UserStats(
          {required final int id,
          @JsonKey(name: 'total_sentences') required final int totalSentences,
          @JsonKey(name: 'total_videos') required final int totalVideos,
          @JsonKey(name: 'total_cards') required final int totalCards}) =
      _$_UserStats;

  factory _UserStats.fromJson(Map<String, dynamic> json) =
      _$_UserStats.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'total_sentences')
  int get totalSentences;
  @override
  @JsonKey(name: 'total_videos')
  int get totalVideos;
  @override
  @JsonKey(name: 'total_cards')
  int get totalCards;
  @override
  @JsonKey(ignore: true)
  _$$_UserStatsCopyWith<_$_UserStats> get copyWith =>
      throw _privateConstructorUsedError;
}
