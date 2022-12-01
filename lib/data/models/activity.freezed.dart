// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  return _Activity.fromJson(json);
}

/// @nodoc
mixin _$Activity {
  Question get question => throw _privateConstructorUsedError;
  Word? get word => throw _privateConstructorUsedError;
  Example? get example => throw _privateConstructorUsedError;
  Style get style => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivityCopyWith<Activity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityCopyWith<$Res> {
  factory $ActivityCopyWith(Activity value, $Res Function(Activity) then) =
      _$ActivityCopyWithImpl<$Res, Activity>;
  @useResult
  $Res call({Question question, Word? word, Example? example, Style style});

  $QuestionCopyWith<$Res> get question;
  $WordCopyWith<$Res>? get word;
  $ExampleCopyWith<$Res>? get example;
  $StyleCopyWith<$Res> get style;
}

/// @nodoc
class _$ActivityCopyWithImpl<$Res, $Val extends Activity>
    implements $ActivityCopyWith<$Res> {
  _$ActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? word = freezed,
    Object? example = freezed,
    Object? style = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question,
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word?,
      example: freezed == example
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as Example?,
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as Style,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionCopyWith<$Res> get question {
    return $QuestionCopyWith<$Res>(_value.question, (value) {
      return _then(_value.copyWith(question: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WordCopyWith<$Res>? get word {
    if (_value.word == null) {
      return null;
    }

    return $WordCopyWith<$Res>(_value.word!, (value) {
      return _then(_value.copyWith(word: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ExampleCopyWith<$Res>? get example {
    if (_value.example == null) {
      return null;
    }

    return $ExampleCopyWith<$Res>(_value.example!, (value) {
      return _then(_value.copyWith(example: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StyleCopyWith<$Res> get style {
    return $StyleCopyWith<$Res>(_value.style, (value) {
      return _then(_value.copyWith(style: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ActivityCopyWith<$Res> implements $ActivityCopyWith<$Res> {
  factory _$$_ActivityCopyWith(
          _$_Activity value, $Res Function(_$_Activity) then) =
      __$$_ActivityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Question question, Word? word, Example? example, Style style});

  @override
  $QuestionCopyWith<$Res> get question;
  @override
  $WordCopyWith<$Res>? get word;
  @override
  $ExampleCopyWith<$Res>? get example;
  @override
  $StyleCopyWith<$Res> get style;
}

/// @nodoc
class __$$_ActivityCopyWithImpl<$Res>
    extends _$ActivityCopyWithImpl<$Res, _$_Activity>
    implements _$$_ActivityCopyWith<$Res> {
  __$$_ActivityCopyWithImpl(
      _$_Activity _value, $Res Function(_$_Activity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? word = freezed,
    Object? example = freezed,
    Object? style = null,
  }) {
    return _then(_$_Activity(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question,
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word?,
      example: freezed == example
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as Example?,
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as Style,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Activity implements _Activity {
  const _$_Activity(
      {required this.question, this.word, this.example, required this.style});

  factory _$_Activity.fromJson(Map<String, dynamic> json) =>
      _$$_ActivityFromJson(json);

  @override
  final Question question;
  @override
  final Word? word;
  @override
  final Example? example;
  @override
  final Style style;

  @override
  String toString() {
    return 'Activity(question: $question, word: $word, example: $example, style: $style)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Activity &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.example, example) || other.example == example) &&
            (identical(other.style, style) || other.style == style));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, question, word, example, style);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ActivityCopyWith<_$_Activity> get copyWith =>
      __$$_ActivityCopyWithImpl<_$_Activity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ActivityToJson(
      this,
    );
  }
}

abstract class _Activity implements Activity {
  const factory _Activity(
      {required final Question question,
      final Word? word,
      final Example? example,
      required final Style style}) = _$_Activity;

  factory _Activity.fromJson(Map<String, dynamic> json) = _$_Activity.fromJson;

  @override
  Question get question;
  @override
  Word? get word;
  @override
  Example? get example;
  @override
  Style get style;
  @override
  @JsonKey(ignore: true)
  _$$_ActivityCopyWith<_$_Activity> get copyWith =>
      throw _privateConstructorUsedError;
}

Word _$WordFromJson(Map<String, dynamic> json) {
  return _Word.fromJson(json);
}

/// @nodoc
mixin _$Word {
  int get id =>
      throw _privateConstructorUsedError; // @JsonKey(fromJson: User._addressFromJson,toJson: User._addressToJson) Address? address,
  @JsonKey(name: 'sentence')
  String get word => throw _privateConstructorUsedError;
  int get origin => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;
  String? get meaning =>
      throw _privateConstructorUsedError; // @Default(false) bool saved,
  @JsonKey(name: 'saved', fromJson: savedFromJson)
  bool get saved => throw _privateConstructorUsedError;
  String? get extras => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_type')
  int? get sourceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'info_card')
  InfoCard? get infoCard => throw _privateConstructorUsedError;
  @JsonKey(name: 'short_video')
  ShortVideo? get shortVideo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordCopyWith<Word> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordCopyWith<$Res> {
  factory $WordCopyWith(Word value, $Res Function(Word) then) =
      _$WordCopyWithImpl<$Res, Word>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'sentence') String word,
      int origin,
      int type,
      String? meaning,
      @JsonKey(name: 'saved', fromJson: savedFromJson) bool saved,
      String? extras,
      @JsonKey(name: 'source_type') int? sourceType,
      @JsonKey(name: 'info_card') InfoCard? infoCard,
      @JsonKey(name: 'short_video') ShortVideo? shortVideo});

  $InfoCardCopyWith<$Res>? get infoCard;
  $ShortVideoCopyWith<$Res>? get shortVideo;
}

/// @nodoc
class _$WordCopyWithImpl<$Res, $Val extends Word>
    implements $WordCopyWith<$Res> {
  _$WordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? word = null,
    Object? origin = null,
    Object? type = null,
    Object? meaning = freezed,
    Object? saved = null,
    Object? extras = freezed,
    Object? sourceType = freezed,
    Object? infoCard = freezed,
    Object? shortVideo = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      meaning: freezed == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String?,
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
      extras: freezed == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceType: freezed == sourceType
          ? _value.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as int?,
      infoCard: freezed == infoCard
          ? _value.infoCard
          : infoCard // ignore: cast_nullable_to_non_nullable
              as InfoCard?,
      shortVideo: freezed == shortVideo
          ? _value.shortVideo
          : shortVideo // ignore: cast_nullable_to_non_nullable
              as ShortVideo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InfoCardCopyWith<$Res>? get infoCard {
    if (_value.infoCard == null) {
      return null;
    }

    return $InfoCardCopyWith<$Res>(_value.infoCard!, (value) {
      return _then(_value.copyWith(infoCard: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShortVideoCopyWith<$Res>? get shortVideo {
    if (_value.shortVideo == null) {
      return null;
    }

    return $ShortVideoCopyWith<$Res>(_value.shortVideo!, (value) {
      return _then(_value.copyWith(shortVideo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WordCopyWith<$Res> implements $WordCopyWith<$Res> {
  factory _$$_WordCopyWith(_$_Word value, $Res Function(_$_Word) then) =
      __$$_WordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'sentence') String word,
      int origin,
      int type,
      String? meaning,
      @JsonKey(name: 'saved', fromJson: savedFromJson) bool saved,
      String? extras,
      @JsonKey(name: 'source_type') int? sourceType,
      @JsonKey(name: 'info_card') InfoCard? infoCard,
      @JsonKey(name: 'short_video') ShortVideo? shortVideo});

  @override
  $InfoCardCopyWith<$Res>? get infoCard;
  @override
  $ShortVideoCopyWith<$Res>? get shortVideo;
}

/// @nodoc
class __$$_WordCopyWithImpl<$Res> extends _$WordCopyWithImpl<$Res, _$_Word>
    implements _$$_WordCopyWith<$Res> {
  __$$_WordCopyWithImpl(_$_Word _value, $Res Function(_$_Word) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? word = null,
    Object? origin = null,
    Object? type = null,
    Object? meaning = freezed,
    Object? saved = null,
    Object? extras = freezed,
    Object? sourceType = freezed,
    Object? infoCard = freezed,
    Object? shortVideo = freezed,
  }) {
    return _then(_$_Word(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      meaning: freezed == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String?,
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
      extras: freezed == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceType: freezed == sourceType
          ? _value.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as int?,
      infoCard: freezed == infoCard
          ? _value.infoCard
          : infoCard // ignore: cast_nullable_to_non_nullable
              as InfoCard?,
      shortVideo: freezed == shortVideo
          ? _value.shortVideo
          : shortVideo // ignore: cast_nullable_to_non_nullable
              as ShortVideo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Word implements _Word {
  const _$_Word(
      {required this.id,
      @JsonKey(name: 'sentence') required this.word,
      required this.origin,
      required this.type,
      this.meaning,
      @JsonKey(name: 'saved', fromJson: savedFromJson) this.saved = false,
      this.extras,
      @JsonKey(name: 'source_type') this.sourceType,
      @JsonKey(name: 'info_card') this.infoCard,
      @JsonKey(name: 'short_video') this.shortVideo});

  factory _$_Word.fromJson(Map<String, dynamic> json) => _$$_WordFromJson(json);

  @override
  final int id;
// @JsonKey(fromJson: User._addressFromJson,toJson: User._addressToJson) Address? address,
  @override
  @JsonKey(name: 'sentence')
  final String word;
  @override
  final int origin;
  @override
  final int type;
  @override
  final String? meaning;
// @Default(false) bool saved,
  @override
  @JsonKey(name: 'saved', fromJson: savedFromJson)
  final bool saved;
  @override
  final String? extras;
  @override
  @JsonKey(name: 'source_type')
  final int? sourceType;
  @override
  @JsonKey(name: 'info_card')
  final InfoCard? infoCard;
  @override
  @JsonKey(name: 'short_video')
  final ShortVideo? shortVideo;

  @override
  String toString() {
    return 'Word(id: $id, word: $word, origin: $origin, type: $type, meaning: $meaning, saved: $saved, extras: $extras, sourceType: $sourceType, infoCard: $infoCard, shortVideo: $shortVideo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Word &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.meaning, meaning) || other.meaning == meaning) &&
            (identical(other.saved, saved) || other.saved == saved) &&
            (identical(other.extras, extras) || other.extras == extras) &&
            (identical(other.sourceType, sourceType) ||
                other.sourceType == sourceType) &&
            (identical(other.infoCard, infoCard) ||
                other.infoCard == infoCard) &&
            (identical(other.shortVideo, shortVideo) ||
                other.shortVideo == shortVideo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, word, origin, type, meaning,
      saved, extras, sourceType, infoCard, shortVideo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WordCopyWith<_$_Word> get copyWith =>
      __$$_WordCopyWithImpl<_$_Word>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordToJson(
      this,
    );
  }
}

abstract class _Word implements Word {
  const factory _Word(
      {required final int id,
      @JsonKey(name: 'sentence') required final String word,
      required final int origin,
      required final int type,
      final String? meaning,
      @JsonKey(name: 'saved', fromJson: savedFromJson) final bool saved,
      final String? extras,
      @JsonKey(name: 'source_type') final int? sourceType,
      @JsonKey(name: 'info_card') final InfoCard? infoCard,
      @JsonKey(name: 'short_video') final ShortVideo? shortVideo}) = _$_Word;

  factory _Word.fromJson(Map<String, dynamic> json) = _$_Word.fromJson;

  @override
  int get id;
  @override // @JsonKey(fromJson: User._addressFromJson,toJson: User._addressToJson) Address? address,
  @JsonKey(name: 'sentence')
  String get word;
  @override
  int get origin;
  @override
  int get type;
  @override
  String? get meaning;
  @override // @Default(false) bool saved,
  @JsonKey(name: 'saved', fromJson: savedFromJson)
  bool get saved;
  @override
  String? get extras;
  @override
  @JsonKey(name: 'source_type')
  int? get sourceType;
  @override
  @JsonKey(name: 'info_card')
  InfoCard? get infoCard;
  @override
  @JsonKey(name: 'short_video')
  ShortVideo? get shortVideo;
  @override
  @JsonKey(ignore: true)
  _$$_WordCopyWith<_$_Word> get copyWith => throw _privateConstructorUsedError;
}

LocalWord _$LocalWordFromJson(Map<String, dynamic> json) {
  return _LocalWord.fromJson(json);
}

/// @nodoc
mixin _$LocalWord {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'sentence')
  String get word => throw _privateConstructorUsedError;
  int get origin => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;
  String? get meaning => throw _privateConstructorUsedError;
  @JsonKey(name: 'saved', fromJson: savedFromJson)
  bool get saved => throw _privateConstructorUsedError;
  String? get extras => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_type')
  int? get sourceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'info_card')
  int? get infoCard => throw _privateConstructorUsedError;
  @JsonKey(name: 'short_video')
  int? get shortVideo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalWordCopyWith<LocalWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalWordCopyWith<$Res> {
  factory $LocalWordCopyWith(LocalWord value, $Res Function(LocalWord) then) =
      _$LocalWordCopyWithImpl<$Res, LocalWord>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'sentence') String word,
      int origin,
      int type,
      String? meaning,
      @JsonKey(name: 'saved', fromJson: savedFromJson) bool saved,
      String? extras,
      @JsonKey(name: 'source_type') int? sourceType,
      @JsonKey(name: 'info_card') int? infoCard,
      @JsonKey(name: 'short_video') int? shortVideo});
}

/// @nodoc
class _$LocalWordCopyWithImpl<$Res, $Val extends LocalWord>
    implements $LocalWordCopyWith<$Res> {
  _$LocalWordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? word = null,
    Object? origin = null,
    Object? type = null,
    Object? meaning = freezed,
    Object? saved = null,
    Object? extras = freezed,
    Object? sourceType = freezed,
    Object? infoCard = freezed,
    Object? shortVideo = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      meaning: freezed == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String?,
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
      extras: freezed == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceType: freezed == sourceType
          ? _value.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$_LocalWordCopyWith<$Res> implements $LocalWordCopyWith<$Res> {
  factory _$$_LocalWordCopyWith(
          _$_LocalWord value, $Res Function(_$_LocalWord) then) =
      __$$_LocalWordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'sentence') String word,
      int origin,
      int type,
      String? meaning,
      @JsonKey(name: 'saved', fromJson: savedFromJson) bool saved,
      String? extras,
      @JsonKey(name: 'source_type') int? sourceType,
      @JsonKey(name: 'info_card') int? infoCard,
      @JsonKey(name: 'short_video') int? shortVideo});
}

/// @nodoc
class __$$_LocalWordCopyWithImpl<$Res>
    extends _$LocalWordCopyWithImpl<$Res, _$_LocalWord>
    implements _$$_LocalWordCopyWith<$Res> {
  __$$_LocalWordCopyWithImpl(
      _$_LocalWord _value, $Res Function(_$_LocalWord) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? word = null,
    Object? origin = null,
    Object? type = null,
    Object? meaning = freezed,
    Object? saved = null,
    Object? extras = freezed,
    Object? sourceType = freezed,
    Object? infoCard = freezed,
    Object? shortVideo = freezed,
  }) {
    return _then(_$_LocalWord(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      meaning: freezed == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String?,
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
      extras: freezed == extras
          ? _value.extras
          : extras // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceType: freezed == sourceType
          ? _value.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$_LocalWord implements _LocalWord {
  const _$_LocalWord(
      {required this.id,
      @JsonKey(name: 'sentence') required this.word,
      required this.origin,
      required this.type,
      this.meaning,
      @JsonKey(name: 'saved', fromJson: savedFromJson) this.saved = false,
      this.extras,
      @JsonKey(name: 'source_type') this.sourceType,
      @JsonKey(name: 'info_card') this.infoCard,
      @JsonKey(name: 'short_video') this.shortVideo});

  factory _$_LocalWord.fromJson(Map<String, dynamic> json) =>
      _$$_LocalWordFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'sentence')
  final String word;
  @override
  final int origin;
  @override
  final int type;
  @override
  final String? meaning;
  @override
  @JsonKey(name: 'saved', fromJson: savedFromJson)
  final bool saved;
  @override
  final String? extras;
  @override
  @JsonKey(name: 'source_type')
  final int? sourceType;
  @override
  @JsonKey(name: 'info_card')
  final int? infoCard;
  @override
  @JsonKey(name: 'short_video')
  final int? shortVideo;

  @override
  String toString() {
    return 'LocalWord(id: $id, word: $word, origin: $origin, type: $type, meaning: $meaning, saved: $saved, extras: $extras, sourceType: $sourceType, infoCard: $infoCard, shortVideo: $shortVideo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalWord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.meaning, meaning) || other.meaning == meaning) &&
            (identical(other.saved, saved) || other.saved == saved) &&
            (identical(other.extras, extras) || other.extras == extras) &&
            (identical(other.sourceType, sourceType) ||
                other.sourceType == sourceType) &&
            (identical(other.infoCard, infoCard) ||
                other.infoCard == infoCard) &&
            (identical(other.shortVideo, shortVideo) ||
                other.shortVideo == shortVideo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, word, origin, type, meaning,
      saved, extras, sourceType, infoCard, shortVideo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalWordCopyWith<_$_LocalWord> get copyWith =>
      __$$_LocalWordCopyWithImpl<_$_LocalWord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocalWordToJson(
      this,
    );
  }
}

abstract class _LocalWord implements LocalWord {
  const factory _LocalWord(
      {required final int id,
      @JsonKey(name: 'sentence') required final String word,
      required final int origin,
      required final int type,
      final String? meaning,
      @JsonKey(name: 'saved', fromJson: savedFromJson) final bool saved,
      final String? extras,
      @JsonKey(name: 'source_type') final int? sourceType,
      @JsonKey(name: 'info_card') final int? infoCard,
      @JsonKey(name: 'short_video') final int? shortVideo}) = _$_LocalWord;

  factory _LocalWord.fromJson(Map<String, dynamic> json) =
      _$_LocalWord.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'sentence')
  String get word;
  @override
  int get origin;
  @override
  int get type;
  @override
  String? get meaning;
  @override
  @JsonKey(name: 'saved', fromJson: savedFromJson)
  bool get saved;
  @override
  String? get extras;
  @override
  @JsonKey(name: 'source_type')
  int? get sourceType;
  @override
  @JsonKey(name: 'info_card')
  int? get infoCard;
  @override
  @JsonKey(name: 'short_video')
  int? get shortVideo;
  @override
  @JsonKey(ignore: true)
  _$$_LocalWordCopyWith<_$_LocalWord> get copyWith =>
      throw _privateConstructorUsedError;
}

Example _$ExampleFromJson(Map<String, dynamic> json) {
  return _Example.fromJson(json);
}

/// @nodoc
mixin _$Example {
  int get id => throw _privateConstructorUsedError;
  List<Map> get example => throw _privateConstructorUsedError;
  @JsonKey(name: 'voice_url')
  String get voiceUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExampleCopyWith<Example> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExampleCopyWith<$Res> {
  factory $ExampleCopyWith(Example value, $Res Function(Example) then) =
      _$ExampleCopyWithImpl<$Res, Example>;
  @useResult
  $Res call(
      {int id, List<Map> example, @JsonKey(name: 'voice_url') String voiceUrl});
}

/// @nodoc
class _$ExampleCopyWithImpl<$Res, $Val extends Example>
    implements $ExampleCopyWith<$Res> {
  _$ExampleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? example = null,
    Object? voiceUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      example: null == example
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as List<Map>,
      voiceUrl: null == voiceUrl
          ? _value.voiceUrl
          : voiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExampleCopyWith<$Res> implements $ExampleCopyWith<$Res> {
  factory _$$_ExampleCopyWith(
          _$_Example value, $Res Function(_$_Example) then) =
      __$$_ExampleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, List<Map> example, @JsonKey(name: 'voice_url') String voiceUrl});
}

/// @nodoc
class __$$_ExampleCopyWithImpl<$Res>
    extends _$ExampleCopyWithImpl<$Res, _$_Example>
    implements _$$_ExampleCopyWith<$Res> {
  __$$_ExampleCopyWithImpl(_$_Example _value, $Res Function(_$_Example) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? example = null,
    Object? voiceUrl = null,
  }) {
    return _then(_$_Example(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      example: null == example
          ? _value._example
          : example // ignore: cast_nullable_to_non_nullable
              as List<Map>,
      voiceUrl: null == voiceUrl
          ? _value.voiceUrl
          : voiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Example implements _Example {
  const _$_Example(
      {required this.id,
      required final List<Map> example,
      @JsonKey(name: 'voice_url') required this.voiceUrl})
      : _example = example;

  factory _$_Example.fromJson(Map<String, dynamic> json) =>
      _$$_ExampleFromJson(json);

  @override
  final int id;
  final List<Map> _example;
  @override
  List<Map> get example {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_example);
  }

  @override
  @JsonKey(name: 'voice_url')
  final String voiceUrl;

  @override
  String toString() {
    return 'Example(id: $id, example: $example, voiceUrl: $voiceUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Example &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._example, _example) &&
            (identical(other.voiceUrl, voiceUrl) ||
                other.voiceUrl == voiceUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_example), voiceUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExampleCopyWith<_$_Example> get copyWith =>
      __$$_ExampleCopyWithImpl<_$_Example>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExampleToJson(
      this,
    );
  }
}

abstract class _Example implements Example {
  const factory _Example(
      {required final int id,
      required final List<Map> example,
      @JsonKey(name: 'voice_url') required final String voiceUrl}) = _$_Example;

  factory _Example.fromJson(Map<String, dynamic> json) = _$_Example.fromJson;

  @override
  int get id;
  @override
  List<Map> get example;
  @override
  @JsonKey(name: 'voice_url')
  String get voiceUrl;
  @override
  @JsonKey(ignore: true)
  _$$_ExampleCopyWith<_$_Example> get copyWith =>
      throw _privateConstructorUsedError;
}

Style _$StyleFromJson(Map<String, dynamic> json) {
  return _Style.fromJson(json);
}

/// @nodoc
mixin _$Style {
  @JsonKey(name: 'background_screen')
  String get backgroundScreen => throw _privateConstructorUsedError;
  @JsonKey(name: 'background_challenge')
  String get backgroundChallenge => throw _privateConstructorUsedError;
  @JsonKey(name: 'use_gradient')
  bool get useGradient => throw _privateConstructorUsedError;
  @JsonKey(name: 'bottom_gradient_color')
  String? get bottomGradientColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'top_gradient_color')
  String? get topGradientColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_position')
  double get questionPosition => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_position')
  double get imagePosition => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_font_size')
  double get questionFontSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_opacity')
  double get questionOpacity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StyleCopyWith<Style> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StyleCopyWith<$Res> {
  factory $StyleCopyWith(Style value, $Res Function(Style) then) =
      _$StyleCopyWithImpl<$Res, Style>;
  @useResult
  $Res call(
      {@JsonKey(name: 'background_screen') String backgroundScreen,
      @JsonKey(name: 'background_challenge') String backgroundChallenge,
      @JsonKey(name: 'use_gradient') bool useGradient,
      @JsonKey(name: 'bottom_gradient_color') String? bottomGradientColor,
      @JsonKey(name: 'top_gradient_color') String? topGradientColor,
      @JsonKey(name: 'question_position') double questionPosition,
      @JsonKey(name: 'image_position') double imagePosition,
      @JsonKey(name: 'question_font_size') double questionFontSize,
      @JsonKey(name: 'question_opacity') double questionOpacity});
}

/// @nodoc
class _$StyleCopyWithImpl<$Res, $Val extends Style>
    implements $StyleCopyWith<$Res> {
  _$StyleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundScreen = null,
    Object? backgroundChallenge = null,
    Object? useGradient = null,
    Object? bottomGradientColor = freezed,
    Object? topGradientColor = freezed,
    Object? questionPosition = null,
    Object? imagePosition = null,
    Object? questionFontSize = null,
    Object? questionOpacity = null,
  }) {
    return _then(_value.copyWith(
      backgroundScreen: null == backgroundScreen
          ? _value.backgroundScreen
          : backgroundScreen // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundChallenge: null == backgroundChallenge
          ? _value.backgroundChallenge
          : backgroundChallenge // ignore: cast_nullable_to_non_nullable
              as String,
      useGradient: null == useGradient
          ? _value.useGradient
          : useGradient // ignore: cast_nullable_to_non_nullable
              as bool,
      bottomGradientColor: freezed == bottomGradientColor
          ? _value.bottomGradientColor
          : bottomGradientColor // ignore: cast_nullable_to_non_nullable
              as String?,
      topGradientColor: freezed == topGradientColor
          ? _value.topGradientColor
          : topGradientColor // ignore: cast_nullable_to_non_nullable
              as String?,
      questionPosition: null == questionPosition
          ? _value.questionPosition
          : questionPosition // ignore: cast_nullable_to_non_nullable
              as double,
      imagePosition: null == imagePosition
          ? _value.imagePosition
          : imagePosition // ignore: cast_nullable_to_non_nullable
              as double,
      questionFontSize: null == questionFontSize
          ? _value.questionFontSize
          : questionFontSize // ignore: cast_nullable_to_non_nullable
              as double,
      questionOpacity: null == questionOpacity
          ? _value.questionOpacity
          : questionOpacity // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StyleCopyWith<$Res> implements $StyleCopyWith<$Res> {
  factory _$$_StyleCopyWith(_$_Style value, $Res Function(_$_Style) then) =
      __$$_StyleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'background_screen') String backgroundScreen,
      @JsonKey(name: 'background_challenge') String backgroundChallenge,
      @JsonKey(name: 'use_gradient') bool useGradient,
      @JsonKey(name: 'bottom_gradient_color') String? bottomGradientColor,
      @JsonKey(name: 'top_gradient_color') String? topGradientColor,
      @JsonKey(name: 'question_position') double questionPosition,
      @JsonKey(name: 'image_position') double imagePosition,
      @JsonKey(name: 'question_font_size') double questionFontSize,
      @JsonKey(name: 'question_opacity') double questionOpacity});
}

/// @nodoc
class __$$_StyleCopyWithImpl<$Res> extends _$StyleCopyWithImpl<$Res, _$_Style>
    implements _$$_StyleCopyWith<$Res> {
  __$$_StyleCopyWithImpl(_$_Style _value, $Res Function(_$_Style) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundScreen = null,
    Object? backgroundChallenge = null,
    Object? useGradient = null,
    Object? bottomGradientColor = freezed,
    Object? topGradientColor = freezed,
    Object? questionPosition = null,
    Object? imagePosition = null,
    Object? questionFontSize = null,
    Object? questionOpacity = null,
  }) {
    return _then(_$_Style(
      backgroundScreen: null == backgroundScreen
          ? _value.backgroundScreen
          : backgroundScreen // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundChallenge: null == backgroundChallenge
          ? _value.backgroundChallenge
          : backgroundChallenge // ignore: cast_nullable_to_non_nullable
              as String,
      useGradient: null == useGradient
          ? _value.useGradient
          : useGradient // ignore: cast_nullable_to_non_nullable
              as bool,
      bottomGradientColor: freezed == bottomGradientColor
          ? _value.bottomGradientColor
          : bottomGradientColor // ignore: cast_nullable_to_non_nullable
              as String?,
      topGradientColor: freezed == topGradientColor
          ? _value.topGradientColor
          : topGradientColor // ignore: cast_nullable_to_non_nullable
              as String?,
      questionPosition: null == questionPosition
          ? _value.questionPosition
          : questionPosition // ignore: cast_nullable_to_non_nullable
              as double,
      imagePosition: null == imagePosition
          ? _value.imagePosition
          : imagePosition // ignore: cast_nullable_to_non_nullable
              as double,
      questionFontSize: null == questionFontSize
          ? _value.questionFontSize
          : questionFontSize // ignore: cast_nullable_to_non_nullable
              as double,
      questionOpacity: null == questionOpacity
          ? _value.questionOpacity
          : questionOpacity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Style implements _Style {
  const _$_Style(
      {@JsonKey(name: 'background_screen') required this.backgroundScreen,
      @JsonKey(name: 'background_challenge') required this.backgroundChallenge,
      @JsonKey(name: 'use_gradient') required this.useGradient,
      @JsonKey(name: 'bottom_gradient_color') this.bottomGradientColor,
      @JsonKey(name: 'top_gradient_color') this.topGradientColor,
      @JsonKey(name: 'question_position') required this.questionPosition,
      @JsonKey(name: 'image_position') required this.imagePosition,
      @JsonKey(name: 'question_font_size') required this.questionFontSize,
      @JsonKey(name: 'question_opacity') required this.questionOpacity});

  factory _$_Style.fromJson(Map<String, dynamic> json) =>
      _$$_StyleFromJson(json);

  @override
  @JsonKey(name: 'background_screen')
  final String backgroundScreen;
  @override
  @JsonKey(name: 'background_challenge')
  final String backgroundChallenge;
  @override
  @JsonKey(name: 'use_gradient')
  final bool useGradient;
  @override
  @JsonKey(name: 'bottom_gradient_color')
  final String? bottomGradientColor;
  @override
  @JsonKey(name: 'top_gradient_color')
  final String? topGradientColor;
  @override
  @JsonKey(name: 'question_position')
  final double questionPosition;
  @override
  @JsonKey(name: 'image_position')
  final double imagePosition;
  @override
  @JsonKey(name: 'question_font_size')
  final double questionFontSize;
  @override
  @JsonKey(name: 'question_opacity')
  final double questionOpacity;

  @override
  String toString() {
    return 'Style(backgroundScreen: $backgroundScreen, backgroundChallenge: $backgroundChallenge, useGradient: $useGradient, bottomGradientColor: $bottomGradientColor, topGradientColor: $topGradientColor, questionPosition: $questionPosition, imagePosition: $imagePosition, questionFontSize: $questionFontSize, questionOpacity: $questionOpacity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Style &&
            (identical(other.backgroundScreen, backgroundScreen) ||
                other.backgroundScreen == backgroundScreen) &&
            (identical(other.backgroundChallenge, backgroundChallenge) ||
                other.backgroundChallenge == backgroundChallenge) &&
            (identical(other.useGradient, useGradient) ||
                other.useGradient == useGradient) &&
            (identical(other.bottomGradientColor, bottomGradientColor) ||
                other.bottomGradientColor == bottomGradientColor) &&
            (identical(other.topGradientColor, topGradientColor) ||
                other.topGradientColor == topGradientColor) &&
            (identical(other.questionPosition, questionPosition) ||
                other.questionPosition == questionPosition) &&
            (identical(other.imagePosition, imagePosition) ||
                other.imagePosition == imagePosition) &&
            (identical(other.questionFontSize, questionFontSize) ||
                other.questionFontSize == questionFontSize) &&
            (identical(other.questionOpacity, questionOpacity) ||
                other.questionOpacity == questionOpacity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      backgroundScreen,
      backgroundChallenge,
      useGradient,
      bottomGradientColor,
      topGradientColor,
      questionPosition,
      imagePosition,
      questionFontSize,
      questionOpacity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StyleCopyWith<_$_Style> get copyWith =>
      __$$_StyleCopyWithImpl<_$_Style>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StyleToJson(
      this,
    );
  }
}

abstract class _Style implements Style {
  const factory _Style(
      {@JsonKey(name: 'background_screen')
          required final String backgroundScreen,
      @JsonKey(name: 'background_challenge')
          required final String backgroundChallenge,
      @JsonKey(name: 'use_gradient')
          required final bool useGradient,
      @JsonKey(name: 'bottom_gradient_color')
          final String? bottomGradientColor,
      @JsonKey(name: 'top_gradient_color')
          final String? topGradientColor,
      @JsonKey(name: 'question_position')
          required final double questionPosition,
      @JsonKey(name: 'image_position')
          required final double imagePosition,
      @JsonKey(name: 'question_font_size')
          required final double questionFontSize,
      @JsonKey(name: 'question_opacity')
          required final double questionOpacity}) = _$_Style;

  factory _Style.fromJson(Map<String, dynamic> json) = _$_Style.fromJson;

  @override
  @JsonKey(name: 'background_screen')
  String get backgroundScreen;
  @override
  @JsonKey(name: 'background_challenge')
  String get backgroundChallenge;
  @override
  @JsonKey(name: 'use_gradient')
  bool get useGradient;
  @override
  @JsonKey(name: 'bottom_gradient_color')
  String? get bottomGradientColor;
  @override
  @JsonKey(name: 'top_gradient_color')
  String? get topGradientColor;
  @override
  @JsonKey(name: 'question_position')
  double get questionPosition;
  @override
  @JsonKey(name: 'image_position')
  double get imagePosition;
  @override
  @JsonKey(name: 'question_font_size')
  double get questionFontSize;
  @override
  @JsonKey(name: 'question_opacity')
  double get questionOpacity;
  @override
  @JsonKey(ignore: true)
  _$$_StyleCopyWith<_$_Style> get copyWith =>
      throw _privateConstructorUsedError;
}

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  int get id => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'voice_url')
  String get voiceUrl => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {int id,
      int type,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'voice_url') String voiceUrl,
      String question});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? imageUrl = null,
    Object? voiceUrl = null,
    Object? question = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      voiceUrl: null == voiceUrl
          ? _value.voiceUrl
          : voiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$$_QuestionCopyWith(
          _$_Question value, $Res Function(_$_Question) then) =
      __$$_QuestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int type,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'voice_url') String voiceUrl,
      String question});
}

/// @nodoc
class __$$_QuestionCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$_Question>
    implements _$$_QuestionCopyWith<$Res> {
  __$$_QuestionCopyWithImpl(
      _$_Question _value, $Res Function(_$_Question) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? imageUrl = null,
    Object? voiceUrl = null,
    Object? question = null,
  }) {
    return _then(_$_Question(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      voiceUrl: null == voiceUrl
          ? _value.voiceUrl
          : voiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Question implements _Question {
  const _$_Question(
      {required this.id,
      required this.type,
      @JsonKey(name: 'image_url') required this.imageUrl,
      @JsonKey(name: 'voice_url') required this.voiceUrl,
      required this.question});

  factory _$_Question.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionFromJson(json);

  @override
  final int id;
  @override
  final int type;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @override
  @JsonKey(name: 'voice_url')
  final String voiceUrl;
  @override
  final String question;

  @override
  String toString() {
    return 'Question(id: $id, type: $type, imageUrl: $imageUrl, voiceUrl: $voiceUrl, question: $question)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Question &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.voiceUrl, voiceUrl) ||
                other.voiceUrl == voiceUrl) &&
            (identical(other.question, question) ||
                other.question == question));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, imageUrl, voiceUrl, question);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      __$$_QuestionCopyWithImpl<_$_Question>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionToJson(
      this,
    );
  }
}

abstract class _Question implements Question {
  const factory _Question(
      {required final int id,
      required final int type,
      @JsonKey(name: 'image_url') required final String imageUrl,
      @JsonKey(name: 'voice_url') required final String voiceUrl,
      required final String question}) = _$_Question;

  factory _Question.fromJson(Map<String, dynamic> json) = _$_Question.fromJson;

  @override
  int get id;
  @override
  int get type;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @override
  @JsonKey(name: 'voice_url')
  String get voiceUrl;
  @override
  String get question;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      throw _privateConstructorUsedError;
}
