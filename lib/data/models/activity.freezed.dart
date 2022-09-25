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
  String get type => throw _privateConstructorUsedError;
  Question? get question => throw _privateConstructorUsedError;
  Word? get word => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_activity')
  ImageActivity? get imageActivity => throw _privateConstructorUsedError;
  Design get design => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivityCopyWith<Activity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityCopyWith<$Res> {
  factory $ActivityCopyWith(Activity value, $Res Function(Activity) then) =
      _$ActivityCopyWithImpl<$Res>;
  $Res call(
      {String type,
      Question? question,
      Word? word,
      @JsonKey(name: 'image_activity') ImageActivity? imageActivity,
      Design design});

  $QuestionCopyWith<$Res>? get question;
  $WordCopyWith<$Res>? get word;
  $ImageActivityCopyWith<$Res>? get imageActivity;
  $DesignCopyWith<$Res> get design;
}

/// @nodoc
class _$ActivityCopyWithImpl<$Res> implements $ActivityCopyWith<$Res> {
  _$ActivityCopyWithImpl(this._value, this._then);

  final Activity _value;
  // ignore: unused_field
  final $Res Function(Activity) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? question = freezed,
    Object? word = freezed,
    Object? imageActivity = freezed,
    Object? design = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question?,
      word: word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word?,
      imageActivity: imageActivity == freezed
          ? _value.imageActivity
          : imageActivity // ignore: cast_nullable_to_non_nullable
              as ImageActivity?,
      design: design == freezed
          ? _value.design
          : design // ignore: cast_nullable_to_non_nullable
              as Design,
    ));
  }

  @override
  $QuestionCopyWith<$Res>? get question {
    if (_value.question == null) {
      return null;
    }

    return $QuestionCopyWith<$Res>(_value.question!, (value) {
      return _then(_value.copyWith(question: value));
    });
  }

  @override
  $WordCopyWith<$Res>? get word {
    if (_value.word == null) {
      return null;
    }

    return $WordCopyWith<$Res>(_value.word!, (value) {
      return _then(_value.copyWith(word: value));
    });
  }

  @override
  $ImageActivityCopyWith<$Res>? get imageActivity {
    if (_value.imageActivity == null) {
      return null;
    }

    return $ImageActivityCopyWith<$Res>(_value.imageActivity!, (value) {
      return _then(_value.copyWith(imageActivity: value));
    });
  }

  @override
  $DesignCopyWith<$Res> get design {
    return $DesignCopyWith<$Res>(_value.design, (value) {
      return _then(_value.copyWith(design: value));
    });
  }
}

/// @nodoc
abstract class _$$_ActivityCopyWith<$Res> implements $ActivityCopyWith<$Res> {
  factory _$$_ActivityCopyWith(
          _$_Activity value, $Res Function(_$_Activity) then) =
      __$$_ActivityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String type,
      Question? question,
      Word? word,
      @JsonKey(name: 'image_activity') ImageActivity? imageActivity,
      Design design});

  @override
  $QuestionCopyWith<$Res>? get question;
  @override
  $WordCopyWith<$Res>? get word;
  @override
  $ImageActivityCopyWith<$Res>? get imageActivity;
  @override
  $DesignCopyWith<$Res> get design;
}

/// @nodoc
class __$$_ActivityCopyWithImpl<$Res> extends _$ActivityCopyWithImpl<$Res>
    implements _$$_ActivityCopyWith<$Res> {
  __$$_ActivityCopyWithImpl(
      _$_Activity _value, $Res Function(_$_Activity) _then)
      : super(_value, (v) => _then(v as _$_Activity));

  @override
  _$_Activity get _value => super._value as _$_Activity;

  @override
  $Res call({
    Object? type = freezed,
    Object? question = freezed,
    Object? word = freezed,
    Object? imageActivity = freezed,
    Object? design = freezed,
  }) {
    return _then(_$_Activity(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question?,
      word: word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word?,
      imageActivity: imageActivity == freezed
          ? _value.imageActivity
          : imageActivity // ignore: cast_nullable_to_non_nullable
              as ImageActivity?,
      design: design == freezed
          ? _value.design
          : design // ignore: cast_nullable_to_non_nullable
              as Design,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Activity implements _Activity {
  const _$_Activity(
      {required this.type,
      this.question,
      this.word,
      @JsonKey(name: 'image_activity') this.imageActivity,
      required this.design});

  factory _$_Activity.fromJson(Map<String, dynamic> json) =>
      _$$_ActivityFromJson(json);

  @override
  final String type;
  @override
  final Question? question;
  @override
  final Word? word;
  @override
  @JsonKey(name: 'image_activity')
  final ImageActivity? imageActivity;
  @override
  final Design design;

  @override
  String toString() {
    return 'Activity(type: $type, question: $question, word: $word, imageActivity: $imageActivity, design: $design)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Activity &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.question, question) &&
            const DeepCollectionEquality().equals(other.word, word) &&
            const DeepCollectionEquality()
                .equals(other.imageActivity, imageActivity) &&
            const DeepCollectionEquality().equals(other.design, design));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(question),
      const DeepCollectionEquality().hash(word),
      const DeepCollectionEquality().hash(imageActivity),
      const DeepCollectionEquality().hash(design));

  @JsonKey(ignore: true)
  @override
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
      {required final String type,
      final Question? question,
      final Word? word,
      @JsonKey(name: 'image_activity') final ImageActivity? imageActivity,
      required final Design design}) = _$_Activity;

  factory _Activity.fromJson(Map<String, dynamic> json) = _$_Activity.fromJson;

  @override
  String get type;
  @override
  Question? get question;
  @override
  Word? get word;
  @override
  @JsonKey(name: 'image_activity')
  ImageActivity? get imageActivity;
  @override
  Design get design;
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
  int get id => throw _privateConstructorUsedError;
  String get word => throw _privateConstructorUsedError;
  String? get meaning => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordCopyWith<Word> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordCopyWith<$Res> {
  factory $WordCopyWith(Word value, $Res Function(Word) then) =
      _$WordCopyWithImpl<$Res>;
  $Res call({int id, String word, String? meaning});
}

/// @nodoc
class _$WordCopyWithImpl<$Res> implements $WordCopyWith<$Res> {
  _$WordCopyWithImpl(this._value, this._then);

  final Word _value;
  // ignore: unused_field
  final $Res Function(Word) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? word = freezed,
    Object? meaning = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      word: word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      meaning: meaning == freezed
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_WordCopyWith<$Res> implements $WordCopyWith<$Res> {
  factory _$$_WordCopyWith(_$_Word value, $Res Function(_$_Word) then) =
      __$$_WordCopyWithImpl<$Res>;
  @override
  $Res call({int id, String word, String? meaning});
}

/// @nodoc
class __$$_WordCopyWithImpl<$Res> extends _$WordCopyWithImpl<$Res>
    implements _$$_WordCopyWith<$Res> {
  __$$_WordCopyWithImpl(_$_Word _value, $Res Function(_$_Word) _then)
      : super(_value, (v) => _then(v as _$_Word));

  @override
  _$_Word get _value => super._value as _$_Word;

  @override
  $Res call({
    Object? id = freezed,
    Object? word = freezed,
    Object? meaning = freezed,
  }) {
    return _then(_$_Word(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      word: word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      meaning: meaning == freezed
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Word implements _Word {
  const _$_Word({required this.id, required this.word, this.meaning});

  factory _$_Word.fromJson(Map<String, dynamic> json) => _$$_WordFromJson(json);

  @override
  final int id;
  @override
  final String word;
  @override
  final String? meaning;

  @override
  String toString() {
    return 'Word(id: $id, word: $word, meaning: $meaning)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Word &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.word, word) &&
            const DeepCollectionEquality().equals(other.meaning, meaning));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(word),
      const DeepCollectionEquality().hash(meaning));

  @JsonKey(ignore: true)
  @override
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
      required final String word,
      final String? meaning}) = _$_Word;

  factory _Word.fromJson(Map<String, dynamic> json) = _$_Word.fromJson;

  @override
  int get id;
  @override
  String get word;
  @override
  String? get meaning;
  @override
  @JsonKey(ignore: true)
  _$$_WordCopyWith<_$_Word> get copyWith => throw _privateConstructorUsedError;
}

Design _$DesignFromJson(Map<String, dynamic> json) {
  return _Design.fromJson(json);
}

/// @nodoc
mixin _$Design {
  @JsonKey(name: 'background_color')
  String get backgroundColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'word_background_color')
  String get wordBackgroundColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DesignCopyWith<Design> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DesignCopyWith<$Res> {
  factory $DesignCopyWith(Design value, $Res Function(Design) then) =
      _$DesignCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'background_color') String backgroundColor,
      @JsonKey(name: 'word_background_color') String wordBackgroundColor});
}

/// @nodoc
class _$DesignCopyWithImpl<$Res> implements $DesignCopyWith<$Res> {
  _$DesignCopyWithImpl(this._value, this._then);

  final Design _value;
  // ignore: unused_field
  final $Res Function(Design) _then;

  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? wordBackgroundColor = freezed,
  }) {
    return _then(_value.copyWith(
      backgroundColor: backgroundColor == freezed
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as String,
      wordBackgroundColor: wordBackgroundColor == freezed
          ? _value.wordBackgroundColor
          : wordBackgroundColor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_DesignCopyWith<$Res> implements $DesignCopyWith<$Res> {
  factory _$$_DesignCopyWith(_$_Design value, $Res Function(_$_Design) then) =
      __$$_DesignCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'background_color') String backgroundColor,
      @JsonKey(name: 'word_background_color') String wordBackgroundColor});
}

/// @nodoc
class __$$_DesignCopyWithImpl<$Res> extends _$DesignCopyWithImpl<$Res>
    implements _$$_DesignCopyWith<$Res> {
  __$$_DesignCopyWithImpl(_$_Design _value, $Res Function(_$_Design) _then)
      : super(_value, (v) => _then(v as _$_Design));

  @override
  _$_Design get _value => super._value as _$_Design;

  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? wordBackgroundColor = freezed,
  }) {
    return _then(_$_Design(
      backgroundColor: backgroundColor == freezed
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as String,
      wordBackgroundColor: wordBackgroundColor == freezed
          ? _value.wordBackgroundColor
          : wordBackgroundColor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Design implements _Design {
  const _$_Design(
      {@JsonKey(name: 'background_color')
          required this.backgroundColor,
      @JsonKey(name: 'word_background_color')
          required this.wordBackgroundColor});

  factory _$_Design.fromJson(Map<String, dynamic> json) =>
      _$$_DesignFromJson(json);

  @override
  @JsonKey(name: 'background_color')
  final String backgroundColor;
  @override
  @JsonKey(name: 'word_background_color')
  final String wordBackgroundColor;

  @override
  String toString() {
    return 'Design(backgroundColor: $backgroundColor, wordBackgroundColor: $wordBackgroundColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Design &&
            const DeepCollectionEquality()
                .equals(other.backgroundColor, backgroundColor) &&
            const DeepCollectionEquality()
                .equals(other.wordBackgroundColor, wordBackgroundColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(wordBackgroundColor));

  @JsonKey(ignore: true)
  @override
  _$$_DesignCopyWith<_$_Design> get copyWith =>
      __$$_DesignCopyWithImpl<_$_Design>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DesignToJson(
      this,
    );
  }
}

abstract class _Design implements Design {
  const factory _Design(
      {@JsonKey(name: 'background_color')
          required final String backgroundColor,
      @JsonKey(name: 'word_background_color')
          required final String wordBackgroundColor}) = _$_Design;

  factory _Design.fromJson(Map<String, dynamic> json) = _$_Design.fromJson;

  @override
  @JsonKey(name: 'background_color')
  String get backgroundColor;
  @override
  @JsonKey(name: 'word_background_color')
  String get wordBackgroundColor;
  @override
  @JsonKey(ignore: true)
  _$$_DesignCopyWith<_$_Design> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageActivity _$ImageActivityFromJson(Map<String, dynamic> json) {
  return _ImageActivity.fromJson(json);
}

/// @nodoc
mixin _$ImageActivity {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageActivityCopyWith<ImageActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageActivityCopyWith<$Res> {
  factory $ImageActivityCopyWith(
          ImageActivity value, $Res Function(ImageActivity) then) =
      _$ImageActivityCopyWithImpl<$Res>;
  $Res call({int id, @JsonKey(name: 'image_url') String imageUrl});
}

/// @nodoc
class _$ImageActivityCopyWithImpl<$Res>
    implements $ImageActivityCopyWith<$Res> {
  _$ImageActivityCopyWithImpl(this._value, this._then);

  final ImageActivity _value;
  // ignore: unused_field
  final $Res Function(ImageActivity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ImageActivityCopyWith<$Res>
    implements $ImageActivityCopyWith<$Res> {
  factory _$$_ImageActivityCopyWith(
          _$_ImageActivity value, $Res Function(_$_ImageActivity) then) =
      __$$_ImageActivityCopyWithImpl<$Res>;
  @override
  $Res call({int id, @JsonKey(name: 'image_url') String imageUrl});
}

/// @nodoc
class __$$_ImageActivityCopyWithImpl<$Res>
    extends _$ImageActivityCopyWithImpl<$Res>
    implements _$$_ImageActivityCopyWith<$Res> {
  __$$_ImageActivityCopyWithImpl(
      _$_ImageActivity _value, $Res Function(_$_ImageActivity) _then)
      : super(_value, (v) => _then(v as _$_ImageActivity));

  @override
  _$_ImageActivity get _value => super._value as _$_ImageActivity;

  @override
  $Res call({
    Object? id = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_ImageActivity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageActivity implements _ImageActivity {
  const _$_ImageActivity(
      {required this.id, @JsonKey(name: 'image_url') required this.imageUrl});

  factory _$_ImageActivity.fromJson(Map<String, dynamic> json) =>
      _$$_ImageActivityFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;

  @override
  String toString() {
    return 'ImageActivity(id: $id, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageActivity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$$_ImageActivityCopyWith<_$_ImageActivity> get copyWith =>
      __$$_ImageActivityCopyWithImpl<_$_ImageActivity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageActivityToJson(
      this,
    );
  }
}

abstract class _ImageActivity implements ImageActivity {
  const factory _ImageActivity(
          {required final int id,
          @JsonKey(name: 'image_url') required final String imageUrl}) =
      _$_ImageActivity;

  factory _ImageActivity.fromJson(Map<String, dynamic> json) =
      _$_ImageActivity.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_ImageActivityCopyWith<_$_ImageActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res>;
  $Res call(
      {int id, @JsonKey(name: 'image_url') String imageUrl, String question});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res> implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  final Question _value;
  // ignore: unused_field
  final $Res Function(Question) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? imageUrl = freezed,
    Object? question = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$$_QuestionCopyWith(
          _$_Question value, $Res Function(_$_Question) then) =
      __$$_QuestionCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id, @JsonKey(name: 'image_url') String imageUrl, String question});
}

/// @nodoc
class __$$_QuestionCopyWithImpl<$Res> extends _$QuestionCopyWithImpl<$Res>
    implements _$$_QuestionCopyWith<$Res> {
  __$$_QuestionCopyWithImpl(
      _$_Question _value, $Res Function(_$_Question) _then)
      : super(_value, (v) => _then(v as _$_Question));

  @override
  _$_Question get _value => super._value as _$_Question;

  @override
  $Res call({
    Object? id = freezed,
    Object? imageUrl = freezed,
    Object? question = freezed,
  }) {
    return _then(_$_Question(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      question: question == freezed
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
      @JsonKey(name: 'image_url') required this.imageUrl,
      required this.question});

  factory _$_Question.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @override
  final String question;

  @override
  String toString() {
    return 'Question(id: $id, imageUrl: $imageUrl, question: $question)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Question &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.question, question));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(question));

  @JsonKey(ignore: true)
  @override
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
      @JsonKey(name: 'image_url') required final String imageUrl,
      required final String question}) = _$_Question;

  factory _Question.fromJson(Map<String, dynamic> json) = _$_Question.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @override
  String get question;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      throw _privateConstructorUsedError;
}
