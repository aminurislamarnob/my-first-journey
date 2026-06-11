// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WordExample {

 String get word; String get image; String get audio;
/// Create a copy of WordExample
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WordExampleCopyWith<WordExample> get copyWith => _$WordExampleCopyWithImpl<WordExample>(this as WordExample, _$identity);

  /// Serializes this WordExample to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WordExample&&(identical(other.word, word) || other.word == word)&&(identical(other.image, image) || other.image == image)&&(identical(other.audio, audio) || other.audio == audio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,word,image,audio);

@override
String toString() {
  return 'WordExample(word: $word, image: $image, audio: $audio)';
}


}

/// @nodoc
abstract mixin class $WordExampleCopyWith<$Res>  {
  factory $WordExampleCopyWith(WordExample value, $Res Function(WordExample) _then) = _$WordExampleCopyWithImpl;
@useResult
$Res call({
 String word, String image, String audio
});




}
/// @nodoc
class _$WordExampleCopyWithImpl<$Res>
    implements $WordExampleCopyWith<$Res> {
  _$WordExampleCopyWithImpl(this._self, this._then);

  final WordExample _self;
  final $Res Function(WordExample) _then;

/// Create a copy of WordExample
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? word = null,Object? image = null,Object? audio = null,}) {
  return _then(_self.copyWith(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,audio: null == audio ? _self.audio : audio // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WordExample].
extension WordExamplePatterns on WordExample {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WordExample value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WordExample() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WordExample value)  $default,){
final _that = this;
switch (_that) {
case _WordExample():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WordExample value)?  $default,){
final _that = this;
switch (_that) {
case _WordExample() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String word,  String image,  String audio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WordExample() when $default != null:
return $default(_that.word,_that.image,_that.audio);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String word,  String image,  String audio)  $default,) {final _that = this;
switch (_that) {
case _WordExample():
return $default(_that.word,_that.image,_that.audio);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String word,  String image,  String audio)?  $default,) {final _that = this;
switch (_that) {
case _WordExample() when $default != null:
return $default(_that.word,_that.image,_that.audio);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WordExample implements WordExample {
  const _WordExample({required this.word, required this.image, required this.audio});
  factory _WordExample.fromJson(Map<String, dynamic> json) => _$WordExampleFromJson(json);

@override final  String word;
@override final  String image;
@override final  String audio;

/// Create a copy of WordExample
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WordExampleCopyWith<_WordExample> get copyWith => __$WordExampleCopyWithImpl<_WordExample>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WordExampleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WordExample&&(identical(other.word, word) || other.word == word)&&(identical(other.image, image) || other.image == image)&&(identical(other.audio, audio) || other.audio == audio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,word,image,audio);

@override
String toString() {
  return 'WordExample(word: $word, image: $image, audio: $audio)';
}


}

/// @nodoc
abstract mixin class _$WordExampleCopyWith<$Res> implements $WordExampleCopyWith<$Res> {
  factory _$WordExampleCopyWith(_WordExample value, $Res Function(_WordExample) _then) = __$WordExampleCopyWithImpl;
@override @useResult
$Res call({
 String word, String image, String audio
});




}
/// @nodoc
class __$WordExampleCopyWithImpl<$Res>
    implements _$WordExampleCopyWith<$Res> {
  __$WordExampleCopyWithImpl(this._self, this._then);

  final _WordExample _self;
  final $Res Function(_WordExample) _then;

/// Create a copy of WordExample
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? word = null,Object? image = null,Object? audio = null,}) {
  return _then(_WordExample(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,audio: null == audio ? _self.audio : audio // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LetterAudio {

 String get name; String? get phonic;
/// Create a copy of LetterAudio
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LetterAudioCopyWith<LetterAudio> get copyWith => _$LetterAudioCopyWithImpl<LetterAudio>(this as LetterAudio, _$identity);

  /// Serializes this LetterAudio to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LetterAudio&&(identical(other.name, name) || other.name == name)&&(identical(other.phonic, phonic) || other.phonic == phonic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phonic);

@override
String toString() {
  return 'LetterAudio(name: $name, phonic: $phonic)';
}


}

/// @nodoc
abstract mixin class $LetterAudioCopyWith<$Res>  {
  factory $LetterAudioCopyWith(LetterAudio value, $Res Function(LetterAudio) _then) = _$LetterAudioCopyWithImpl;
@useResult
$Res call({
 String name, String? phonic
});




}
/// @nodoc
class _$LetterAudioCopyWithImpl<$Res>
    implements $LetterAudioCopyWith<$Res> {
  _$LetterAudioCopyWithImpl(this._self, this._then);

  final LetterAudio _self;
  final $Res Function(LetterAudio) _then;

/// Create a copy of LetterAudio
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? phonic = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phonic: freezed == phonic ? _self.phonic : phonic // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LetterAudio].
extension LetterAudioPatterns on LetterAudio {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LetterAudio value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LetterAudio() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LetterAudio value)  $default,){
final _that = this;
switch (_that) {
case _LetterAudio():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LetterAudio value)?  $default,){
final _that = this;
switch (_that) {
case _LetterAudio() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? phonic)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LetterAudio() when $default != null:
return $default(_that.name,_that.phonic);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? phonic)  $default,) {final _that = this;
switch (_that) {
case _LetterAudio():
return $default(_that.name,_that.phonic);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? phonic)?  $default,) {final _that = this;
switch (_that) {
case _LetterAudio() when $default != null:
return $default(_that.name,_that.phonic);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LetterAudio implements LetterAudio {
  const _LetterAudio({required this.name, this.phonic});
  factory _LetterAudio.fromJson(Map<String, dynamic> json) => _$LetterAudioFromJson(json);

@override final  String name;
@override final  String? phonic;

/// Create a copy of LetterAudio
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LetterAudioCopyWith<_LetterAudio> get copyWith => __$LetterAudioCopyWithImpl<_LetterAudio>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LetterAudioToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LetterAudio&&(identical(other.name, name) || other.name == name)&&(identical(other.phonic, phonic) || other.phonic == phonic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phonic);

@override
String toString() {
  return 'LetterAudio(name: $name, phonic: $phonic)';
}


}

/// @nodoc
abstract mixin class _$LetterAudioCopyWith<$Res> implements $LetterAudioCopyWith<$Res> {
  factory _$LetterAudioCopyWith(_LetterAudio value, $Res Function(_LetterAudio) _then) = __$LetterAudioCopyWithImpl;
@override @useResult
$Res call({
 String name, String? phonic
});




}
/// @nodoc
class __$LetterAudioCopyWithImpl<$Res>
    implements _$LetterAudioCopyWith<$Res> {
  __$LetterAudioCopyWithImpl(this._self, this._then);

  final _LetterAudio _self;
  final $Res Function(_LetterAudio) _then;

/// Create a copy of LetterAudio
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? phonic = freezed,}) {
  return _then(_LetterAudio(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phonic: freezed == phonic ? _self.phonic : phonic // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Letter {

 String get id; String get glyph; String? get lowercase; String get name; LetterAudio get audio; List<WordExample> get examples;
/// Create a copy of Letter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LetterCopyWith<Letter> get copyWith => _$LetterCopyWithImpl<Letter>(this as Letter, _$identity);

  /// Serializes this Letter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Letter&&(identical(other.id, id) || other.id == id)&&(identical(other.glyph, glyph) || other.glyph == glyph)&&(identical(other.lowercase, lowercase) || other.lowercase == lowercase)&&(identical(other.name, name) || other.name == name)&&(identical(other.audio, audio) || other.audio == audio)&&const DeepCollectionEquality().equals(other.examples, examples));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,glyph,lowercase,name,audio,const DeepCollectionEquality().hash(examples));

@override
String toString() {
  return 'Letter(id: $id, glyph: $glyph, lowercase: $lowercase, name: $name, audio: $audio, examples: $examples)';
}


}

/// @nodoc
abstract mixin class $LetterCopyWith<$Res>  {
  factory $LetterCopyWith(Letter value, $Res Function(Letter) _then) = _$LetterCopyWithImpl;
@useResult
$Res call({
 String id, String glyph, String? lowercase, String name, LetterAudio audio, List<WordExample> examples
});


$LetterAudioCopyWith<$Res> get audio;

}
/// @nodoc
class _$LetterCopyWithImpl<$Res>
    implements $LetterCopyWith<$Res> {
  _$LetterCopyWithImpl(this._self, this._then);

  final Letter _self;
  final $Res Function(Letter) _then;

/// Create a copy of Letter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? glyph = null,Object? lowercase = freezed,Object? name = null,Object? audio = null,Object? examples = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,glyph: null == glyph ? _self.glyph : glyph // ignore: cast_nullable_to_non_nullable
as String,lowercase: freezed == lowercase ? _self.lowercase : lowercase // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,audio: null == audio ? _self.audio : audio // ignore: cast_nullable_to_non_nullable
as LetterAudio,examples: null == examples ? _self.examples : examples // ignore: cast_nullable_to_non_nullable
as List<WordExample>,
  ));
}
/// Create a copy of Letter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LetterAudioCopyWith<$Res> get audio {
  
  return $LetterAudioCopyWith<$Res>(_self.audio, (value) {
    return _then(_self.copyWith(audio: value));
  });
}
}


/// Adds pattern-matching-related methods to [Letter].
extension LetterPatterns on Letter {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Letter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Letter() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Letter value)  $default,){
final _that = this;
switch (_that) {
case _Letter():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Letter value)?  $default,){
final _that = this;
switch (_that) {
case _Letter() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String glyph,  String? lowercase,  String name,  LetterAudio audio,  List<WordExample> examples)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Letter() when $default != null:
return $default(_that.id,_that.glyph,_that.lowercase,_that.name,_that.audio,_that.examples);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String glyph,  String? lowercase,  String name,  LetterAudio audio,  List<WordExample> examples)  $default,) {final _that = this;
switch (_that) {
case _Letter():
return $default(_that.id,_that.glyph,_that.lowercase,_that.name,_that.audio,_that.examples);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String glyph,  String? lowercase,  String name,  LetterAudio audio,  List<WordExample> examples)?  $default,) {final _that = this;
switch (_that) {
case _Letter() when $default != null:
return $default(_that.id,_that.glyph,_that.lowercase,_that.name,_that.audio,_that.examples);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Letter implements Letter {
  const _Letter({required this.id, required this.glyph, this.lowercase, required this.name, required this.audio, final  List<WordExample> examples = const <WordExample>[]}): _examples = examples;
  factory _Letter.fromJson(Map<String, dynamic> json) => _$LetterFromJson(json);

@override final  String id;
@override final  String glyph;
@override final  String? lowercase;
@override final  String name;
@override final  LetterAudio audio;
 final  List<WordExample> _examples;
@override@JsonKey() List<WordExample> get examples {
  if (_examples is EqualUnmodifiableListView) return _examples;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_examples);
}


/// Create a copy of Letter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LetterCopyWith<_Letter> get copyWith => __$LetterCopyWithImpl<_Letter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LetterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Letter&&(identical(other.id, id) || other.id == id)&&(identical(other.glyph, glyph) || other.glyph == glyph)&&(identical(other.lowercase, lowercase) || other.lowercase == lowercase)&&(identical(other.name, name) || other.name == name)&&(identical(other.audio, audio) || other.audio == audio)&&const DeepCollectionEquality().equals(other._examples, _examples));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,glyph,lowercase,name,audio,const DeepCollectionEquality().hash(_examples));

@override
String toString() {
  return 'Letter(id: $id, glyph: $glyph, lowercase: $lowercase, name: $name, audio: $audio, examples: $examples)';
}


}

/// @nodoc
abstract mixin class _$LetterCopyWith<$Res> implements $LetterCopyWith<$Res> {
  factory _$LetterCopyWith(_Letter value, $Res Function(_Letter) _then) = __$LetterCopyWithImpl;
@override @useResult
$Res call({
 String id, String glyph, String? lowercase, String name, LetterAudio audio, List<WordExample> examples
});


@override $LetterAudioCopyWith<$Res> get audio;

}
/// @nodoc
class __$LetterCopyWithImpl<$Res>
    implements _$LetterCopyWith<$Res> {
  __$LetterCopyWithImpl(this._self, this._then);

  final _Letter _self;
  final $Res Function(_Letter) _then;

/// Create a copy of Letter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? glyph = null,Object? lowercase = freezed,Object? name = null,Object? audio = null,Object? examples = null,}) {
  return _then(_Letter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,glyph: null == glyph ? _self.glyph : glyph // ignore: cast_nullable_to_non_nullable
as String,lowercase: freezed == lowercase ? _self.lowercase : lowercase // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,audio: null == audio ? _self.audio : audio // ignore: cast_nullable_to_non_nullable
as LetterAudio,examples: null == examples ? _self._examples : examples // ignore: cast_nullable_to_non_nullable
as List<WordExample>,
  ));
}

/// Create a copy of Letter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LetterAudioCopyWith<$Res> get audio {
  
  return $LetterAudioCopyWith<$Res>(_self.audio, (value) {
    return _then(_self.copyWith(audio: value));
  });
}
}


/// @nodoc
mixin _$AlphabetTrack {

 String get id; LocalizedText get title; List<Letter> get letters;
/// Create a copy of AlphabetTrack
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlphabetTrackCopyWith<AlphabetTrack> get copyWith => _$AlphabetTrackCopyWithImpl<AlphabetTrack>(this as AlphabetTrack, _$identity);

  /// Serializes this AlphabetTrack to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlphabetTrack&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.title, title)&&const DeepCollectionEquality().equals(other.letters, letters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(title),const DeepCollectionEquality().hash(letters));

@override
String toString() {
  return 'AlphabetTrack(id: $id, title: $title, letters: $letters)';
}


}

/// @nodoc
abstract mixin class $AlphabetTrackCopyWith<$Res>  {
  factory $AlphabetTrackCopyWith(AlphabetTrack value, $Res Function(AlphabetTrack) _then) = _$AlphabetTrackCopyWithImpl;
@useResult
$Res call({
 String id, LocalizedText title, List<Letter> letters
});




}
/// @nodoc
class _$AlphabetTrackCopyWithImpl<$Res>
    implements $AlphabetTrackCopyWith<$Res> {
  _$AlphabetTrackCopyWithImpl(this._self, this._then);

  final AlphabetTrack _self;
  final $Res Function(AlphabetTrack) _then;

/// Create a copy of AlphabetTrack
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? letters = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,letters: null == letters ? _self.letters : letters // ignore: cast_nullable_to_non_nullable
as List<Letter>,
  ));
}

}


/// Adds pattern-matching-related methods to [AlphabetTrack].
extension AlphabetTrackPatterns on AlphabetTrack {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlphabetTrack value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlphabetTrack() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlphabetTrack value)  $default,){
final _that = this;
switch (_that) {
case _AlphabetTrack():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlphabetTrack value)?  $default,){
final _that = this;
switch (_that) {
case _AlphabetTrack() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LocalizedText title,  List<Letter> letters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlphabetTrack() when $default != null:
return $default(_that.id,_that.title,_that.letters);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LocalizedText title,  List<Letter> letters)  $default,) {final _that = this;
switch (_that) {
case _AlphabetTrack():
return $default(_that.id,_that.title,_that.letters);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LocalizedText title,  List<Letter> letters)?  $default,) {final _that = this;
switch (_that) {
case _AlphabetTrack() when $default != null:
return $default(_that.id,_that.title,_that.letters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlphabetTrack implements AlphabetTrack {
  const _AlphabetTrack({required this.id, required final  LocalizedText title, final  List<Letter> letters = const <Letter>[]}): _title = title,_letters = letters;
  factory _AlphabetTrack.fromJson(Map<String, dynamic> json) => _$AlphabetTrackFromJson(json);

@override final  String id;
 final  LocalizedText _title;
@override LocalizedText get title {
  if (_title is EqualUnmodifiableMapView) return _title;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_title);
}

 final  List<Letter> _letters;
@override@JsonKey() List<Letter> get letters {
  if (_letters is EqualUnmodifiableListView) return _letters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_letters);
}


/// Create a copy of AlphabetTrack
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlphabetTrackCopyWith<_AlphabetTrack> get copyWith => __$AlphabetTrackCopyWithImpl<_AlphabetTrack>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlphabetTrackToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlphabetTrack&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._title, _title)&&const DeepCollectionEquality().equals(other._letters, _letters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_title),const DeepCollectionEquality().hash(_letters));

@override
String toString() {
  return 'AlphabetTrack(id: $id, title: $title, letters: $letters)';
}


}

/// @nodoc
abstract mixin class _$AlphabetTrackCopyWith<$Res> implements $AlphabetTrackCopyWith<$Res> {
  factory _$AlphabetTrackCopyWith(_AlphabetTrack value, $Res Function(_AlphabetTrack) _then) = __$AlphabetTrackCopyWithImpl;
@override @useResult
$Res call({
 String id, LocalizedText title, List<Letter> letters
});




}
/// @nodoc
class __$AlphabetTrackCopyWithImpl<$Res>
    implements _$AlphabetTrackCopyWith<$Res> {
  __$AlphabetTrackCopyWithImpl(this._self, this._then);

  final _AlphabetTrack _self;
  final $Res Function(_AlphabetTrack) _then;

/// Create a copy of AlphabetTrack
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? letters = null,}) {
  return _then(_AlphabetTrack(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self._title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,letters: null == letters ? _self._letters : letters // ignore: cast_nullable_to_non_nullable
as List<Letter>,
  ));
}


}


/// @nodoc
mixin _$AlphabetManifest {

 String get id; LocalizedText get title; String get color; String get direction; String get script; bool get hasCaseToggle; List<AlphabetTrack> get tracks;
/// Create a copy of AlphabetManifest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlphabetManifestCopyWith<AlphabetManifest> get copyWith => _$AlphabetManifestCopyWithImpl<AlphabetManifest>(this as AlphabetManifest, _$identity);

  /// Serializes this AlphabetManifest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlphabetManifest&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.title, title)&&(identical(other.color, color) || other.color == color)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.script, script) || other.script == script)&&(identical(other.hasCaseToggle, hasCaseToggle) || other.hasCaseToggle == hasCaseToggle)&&const DeepCollectionEquality().equals(other.tracks, tracks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(title),color,direction,script,hasCaseToggle,const DeepCollectionEquality().hash(tracks));

@override
String toString() {
  return 'AlphabetManifest(id: $id, title: $title, color: $color, direction: $direction, script: $script, hasCaseToggle: $hasCaseToggle, tracks: $tracks)';
}


}

/// @nodoc
abstract mixin class $AlphabetManifestCopyWith<$Res>  {
  factory $AlphabetManifestCopyWith(AlphabetManifest value, $Res Function(AlphabetManifest) _then) = _$AlphabetManifestCopyWithImpl;
@useResult
$Res call({
 String id, LocalizedText title, String color, String direction, String script, bool hasCaseToggle, List<AlphabetTrack> tracks
});




}
/// @nodoc
class _$AlphabetManifestCopyWithImpl<$Res>
    implements $AlphabetManifestCopyWith<$Res> {
  _$AlphabetManifestCopyWithImpl(this._self, this._then);

  final AlphabetManifest _self;
  final $Res Function(AlphabetManifest) _then;

/// Create a copy of AlphabetManifest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? color = null,Object? direction = null,Object? script = null,Object? hasCaseToggle = null,Object? tracks = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as String,script: null == script ? _self.script : script // ignore: cast_nullable_to_non_nullable
as String,hasCaseToggle: null == hasCaseToggle ? _self.hasCaseToggle : hasCaseToggle // ignore: cast_nullable_to_non_nullable
as bool,tracks: null == tracks ? _self.tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<AlphabetTrack>,
  ));
}

}


/// Adds pattern-matching-related methods to [AlphabetManifest].
extension AlphabetManifestPatterns on AlphabetManifest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlphabetManifest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlphabetManifest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlphabetManifest value)  $default,){
final _that = this;
switch (_that) {
case _AlphabetManifest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlphabetManifest value)?  $default,){
final _that = this;
switch (_that) {
case _AlphabetManifest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LocalizedText title,  String color,  String direction,  String script,  bool hasCaseToggle,  List<AlphabetTrack> tracks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlphabetManifest() when $default != null:
return $default(_that.id,_that.title,_that.color,_that.direction,_that.script,_that.hasCaseToggle,_that.tracks);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LocalizedText title,  String color,  String direction,  String script,  bool hasCaseToggle,  List<AlphabetTrack> tracks)  $default,) {final _that = this;
switch (_that) {
case _AlphabetManifest():
return $default(_that.id,_that.title,_that.color,_that.direction,_that.script,_that.hasCaseToggle,_that.tracks);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LocalizedText title,  String color,  String direction,  String script,  bool hasCaseToggle,  List<AlphabetTrack> tracks)?  $default,) {final _that = this;
switch (_that) {
case _AlphabetManifest() when $default != null:
return $default(_that.id,_that.title,_that.color,_that.direction,_that.script,_that.hasCaseToggle,_that.tracks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlphabetManifest extends AlphabetManifest {
  const _AlphabetManifest({required this.id, required final  LocalizedText title, required this.color, this.direction = 'ltr', this.script = 'latin', this.hasCaseToggle = false, final  List<AlphabetTrack> tracks = const <AlphabetTrack>[]}): _title = title,_tracks = tracks,super._();
  factory _AlphabetManifest.fromJson(Map<String, dynamic> json) => _$AlphabetManifestFromJson(json);

@override final  String id;
 final  LocalizedText _title;
@override LocalizedText get title {
  if (_title is EqualUnmodifiableMapView) return _title;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_title);
}

@override final  String color;
@override@JsonKey() final  String direction;
@override@JsonKey() final  String script;
@override@JsonKey() final  bool hasCaseToggle;
 final  List<AlphabetTrack> _tracks;
@override@JsonKey() List<AlphabetTrack> get tracks {
  if (_tracks is EqualUnmodifiableListView) return _tracks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tracks);
}


/// Create a copy of AlphabetManifest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlphabetManifestCopyWith<_AlphabetManifest> get copyWith => __$AlphabetManifestCopyWithImpl<_AlphabetManifest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlphabetManifestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlphabetManifest&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._title, _title)&&(identical(other.color, color) || other.color == color)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.script, script) || other.script == script)&&(identical(other.hasCaseToggle, hasCaseToggle) || other.hasCaseToggle == hasCaseToggle)&&const DeepCollectionEquality().equals(other._tracks, _tracks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_title),color,direction,script,hasCaseToggle,const DeepCollectionEquality().hash(_tracks));

@override
String toString() {
  return 'AlphabetManifest(id: $id, title: $title, color: $color, direction: $direction, script: $script, hasCaseToggle: $hasCaseToggle, tracks: $tracks)';
}


}

/// @nodoc
abstract mixin class _$AlphabetManifestCopyWith<$Res> implements $AlphabetManifestCopyWith<$Res> {
  factory _$AlphabetManifestCopyWith(_AlphabetManifest value, $Res Function(_AlphabetManifest) _then) = __$AlphabetManifestCopyWithImpl;
@override @useResult
$Res call({
 String id, LocalizedText title, String color, String direction, String script, bool hasCaseToggle, List<AlphabetTrack> tracks
});




}
/// @nodoc
class __$AlphabetManifestCopyWithImpl<$Res>
    implements _$AlphabetManifestCopyWith<$Res> {
  __$AlphabetManifestCopyWithImpl(this._self, this._then);

  final _AlphabetManifest _self;
  final $Res Function(_AlphabetManifest) _then;

/// Create a copy of AlphabetManifest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? color = null,Object? direction = null,Object? script = null,Object? hasCaseToggle = null,Object? tracks = null,}) {
  return _then(_AlphabetManifest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self._title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as String,script: null == script ? _self.script : script // ignore: cast_nullable_to_non_nullable
as String,hasCaseToggle: null == hasCaseToggle ? _self.hasCaseToggle : hasCaseToggle // ignore: cast_nullable_to_non_nullable
as bool,tracks: null == tracks ? _self._tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<AlphabetTrack>,
  ));
}


}


/// @nodoc
mixin _$FlashGroup {

 String get id; LocalizedText get title; String? get icon;
/// Create a copy of FlashGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlashGroupCopyWith<FlashGroup> get copyWith => _$FlashGroupCopyWithImpl<FlashGroup>(this as FlashGroup, _$identity);

  /// Serializes this FlashGroup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlashGroup&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.title, title)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(title),icon);

@override
String toString() {
  return 'FlashGroup(id: $id, title: $title, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $FlashGroupCopyWith<$Res>  {
  factory $FlashGroupCopyWith(FlashGroup value, $Res Function(FlashGroup) _then) = _$FlashGroupCopyWithImpl;
@useResult
$Res call({
 String id, LocalizedText title, String? icon
});




}
/// @nodoc
class _$FlashGroupCopyWithImpl<$Res>
    implements $FlashGroupCopyWith<$Res> {
  _$FlashGroupCopyWithImpl(this._self, this._then);

  final FlashGroup _self;
  final $Res Function(FlashGroup) _then;

/// Create a copy of FlashGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? icon = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FlashGroup].
extension FlashGroupPatterns on FlashGroup {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlashGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlashGroup() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlashGroup value)  $default,){
final _that = this;
switch (_that) {
case _FlashGroup():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlashGroup value)?  $default,){
final _that = this;
switch (_that) {
case _FlashGroup() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LocalizedText title,  String? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlashGroup() when $default != null:
return $default(_that.id,_that.title,_that.icon);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LocalizedText title,  String? icon)  $default,) {final _that = this;
switch (_that) {
case _FlashGroup():
return $default(_that.id,_that.title,_that.icon);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LocalizedText title,  String? icon)?  $default,) {final _that = this;
switch (_that) {
case _FlashGroup() when $default != null:
return $default(_that.id,_that.title,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlashGroup implements FlashGroup {
  const _FlashGroup({required this.id, required final  LocalizedText title, this.icon}): _title = title;
  factory _FlashGroup.fromJson(Map<String, dynamic> json) => _$FlashGroupFromJson(json);

@override final  String id;
 final  LocalizedText _title;
@override LocalizedText get title {
  if (_title is EqualUnmodifiableMapView) return _title;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_title);
}

@override final  String? icon;

/// Create a copy of FlashGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlashGroupCopyWith<_FlashGroup> get copyWith => __$FlashGroupCopyWithImpl<_FlashGroup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlashGroupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlashGroup&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._title, _title)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_title),icon);

@override
String toString() {
  return 'FlashGroup(id: $id, title: $title, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$FlashGroupCopyWith<$Res> implements $FlashGroupCopyWith<$Res> {
  factory _$FlashGroupCopyWith(_FlashGroup value, $Res Function(_FlashGroup) _then) = __$FlashGroupCopyWithImpl;
@override @useResult
$Res call({
 String id, LocalizedText title, String? icon
});




}
/// @nodoc
class __$FlashGroupCopyWithImpl<$Res>
    implements _$FlashGroupCopyWith<$Res> {
  __$FlashGroupCopyWithImpl(this._self, this._then);

  final _FlashGroup _self;
  final $Res Function(_FlashGroup) _then;

/// Create a copy of FlashGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? icon = freezed,}) {
  return _then(_FlashGroup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self._title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$FlashItem {

 String get id; String get group; LocalizedText get names; String? get icon; String? get photo; String? get illustration; String? get sound; Map<String, String> get nameAudio;
/// Create a copy of FlashItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlashItemCopyWith<FlashItem> get copyWith => _$FlashItemCopyWithImpl<FlashItem>(this as FlashItem, _$identity);

  /// Serializes this FlashItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlashItem&&(identical(other.id, id) || other.id == id)&&(identical(other.group, group) || other.group == group)&&const DeepCollectionEquality().equals(other.names, names)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.illustration, illustration) || other.illustration == illustration)&&(identical(other.sound, sound) || other.sound == sound)&&const DeepCollectionEquality().equals(other.nameAudio, nameAudio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,group,const DeepCollectionEquality().hash(names),icon,photo,illustration,sound,const DeepCollectionEquality().hash(nameAudio));

@override
String toString() {
  return 'FlashItem(id: $id, group: $group, names: $names, icon: $icon, photo: $photo, illustration: $illustration, sound: $sound, nameAudio: $nameAudio)';
}


}

/// @nodoc
abstract mixin class $FlashItemCopyWith<$Res>  {
  factory $FlashItemCopyWith(FlashItem value, $Res Function(FlashItem) _then) = _$FlashItemCopyWithImpl;
@useResult
$Res call({
 String id, String group, LocalizedText names, String? icon, String? photo, String? illustration, String? sound, Map<String, String> nameAudio
});




}
/// @nodoc
class _$FlashItemCopyWithImpl<$Res>
    implements $FlashItemCopyWith<$Res> {
  _$FlashItemCopyWithImpl(this._self, this._then);

  final FlashItem _self;
  final $Res Function(FlashItem) _then;

/// Create a copy of FlashItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? group = null,Object? names = null,Object? icon = freezed,Object? photo = freezed,Object? illustration = freezed,Object? sound = freezed,Object? nameAudio = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,names: null == names ? _self.names : names // ignore: cast_nullable_to_non_nullable
as LocalizedText,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,illustration: freezed == illustration ? _self.illustration : illustration // ignore: cast_nullable_to_non_nullable
as String?,sound: freezed == sound ? _self.sound : sound // ignore: cast_nullable_to_non_nullable
as String?,nameAudio: null == nameAudio ? _self.nameAudio : nameAudio // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [FlashItem].
extension FlashItemPatterns on FlashItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlashItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlashItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlashItem value)  $default,){
final _that = this;
switch (_that) {
case _FlashItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlashItem value)?  $default,){
final _that = this;
switch (_that) {
case _FlashItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String group,  LocalizedText names,  String? icon,  String? photo,  String? illustration,  String? sound,  Map<String, String> nameAudio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlashItem() when $default != null:
return $default(_that.id,_that.group,_that.names,_that.icon,_that.photo,_that.illustration,_that.sound,_that.nameAudio);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String group,  LocalizedText names,  String? icon,  String? photo,  String? illustration,  String? sound,  Map<String, String> nameAudio)  $default,) {final _that = this;
switch (_that) {
case _FlashItem():
return $default(_that.id,_that.group,_that.names,_that.icon,_that.photo,_that.illustration,_that.sound,_that.nameAudio);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String group,  LocalizedText names,  String? icon,  String? photo,  String? illustration,  String? sound,  Map<String, String> nameAudio)?  $default,) {final _that = this;
switch (_that) {
case _FlashItem() when $default != null:
return $default(_that.id,_that.group,_that.names,_that.icon,_that.photo,_that.illustration,_that.sound,_that.nameAudio);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlashItem implements FlashItem {
  const _FlashItem({required this.id, required this.group, required final  LocalizedText names, this.icon, this.photo, this.illustration, this.sound, final  Map<String, String> nameAudio = const <String, String>{}}): _names = names,_nameAudio = nameAudio;
  factory _FlashItem.fromJson(Map<String, dynamic> json) => _$FlashItemFromJson(json);

@override final  String id;
@override final  String group;
 final  LocalizedText _names;
@override LocalizedText get names {
  if (_names is EqualUnmodifiableMapView) return _names;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_names);
}

@override final  String? icon;
@override final  String? photo;
@override final  String? illustration;
@override final  String? sound;
 final  Map<String, String> _nameAudio;
@override@JsonKey() Map<String, String> get nameAudio {
  if (_nameAudio is EqualUnmodifiableMapView) return _nameAudio;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_nameAudio);
}


/// Create a copy of FlashItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlashItemCopyWith<_FlashItem> get copyWith => __$FlashItemCopyWithImpl<_FlashItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlashItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlashItem&&(identical(other.id, id) || other.id == id)&&(identical(other.group, group) || other.group == group)&&const DeepCollectionEquality().equals(other._names, _names)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.illustration, illustration) || other.illustration == illustration)&&(identical(other.sound, sound) || other.sound == sound)&&const DeepCollectionEquality().equals(other._nameAudio, _nameAudio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,group,const DeepCollectionEquality().hash(_names),icon,photo,illustration,sound,const DeepCollectionEquality().hash(_nameAudio));

@override
String toString() {
  return 'FlashItem(id: $id, group: $group, names: $names, icon: $icon, photo: $photo, illustration: $illustration, sound: $sound, nameAudio: $nameAudio)';
}


}

/// @nodoc
abstract mixin class _$FlashItemCopyWith<$Res> implements $FlashItemCopyWith<$Res> {
  factory _$FlashItemCopyWith(_FlashItem value, $Res Function(_FlashItem) _then) = __$FlashItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String group, LocalizedText names, String? icon, String? photo, String? illustration, String? sound, Map<String, String> nameAudio
});




}
/// @nodoc
class __$FlashItemCopyWithImpl<$Res>
    implements _$FlashItemCopyWith<$Res> {
  __$FlashItemCopyWithImpl(this._self, this._then);

  final _FlashItem _self;
  final $Res Function(_FlashItem) _then;

/// Create a copy of FlashItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? group = null,Object? names = null,Object? icon = freezed,Object? photo = freezed,Object? illustration = freezed,Object? sound = freezed,Object? nameAudio = null,}) {
  return _then(_FlashItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,names: null == names ? _self._names : names // ignore: cast_nullable_to_non_nullable
as LocalizedText,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String?,illustration: freezed == illustration ? _self.illustration : illustration // ignore: cast_nullable_to_non_nullable
as String?,sound: freezed == sound ? _self.sound : sound // ignore: cast_nullable_to_non_nullable
as String?,nameAudio: null == nameAudio ? _self._nameAudio : nameAudio // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}


/// @nodoc
mixin _$FlashcardManifest {

 String get id; LocalizedText get title; String get color; List<FlashGroup> get groups; List<FlashItem> get items;
/// Create a copy of FlashcardManifest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlashcardManifestCopyWith<FlashcardManifest> get copyWith => _$FlashcardManifestCopyWithImpl<FlashcardManifest>(this as FlashcardManifest, _$identity);

  /// Serializes this FlashcardManifest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlashcardManifest&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.title, title)&&(identical(other.color, color) || other.color == color)&&const DeepCollectionEquality().equals(other.groups, groups)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(title),color,const DeepCollectionEquality().hash(groups),const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'FlashcardManifest(id: $id, title: $title, color: $color, groups: $groups, items: $items)';
}


}

/// @nodoc
abstract mixin class $FlashcardManifestCopyWith<$Res>  {
  factory $FlashcardManifestCopyWith(FlashcardManifest value, $Res Function(FlashcardManifest) _then) = _$FlashcardManifestCopyWithImpl;
@useResult
$Res call({
 String id, LocalizedText title, String color, List<FlashGroup> groups, List<FlashItem> items
});




}
/// @nodoc
class _$FlashcardManifestCopyWithImpl<$Res>
    implements $FlashcardManifestCopyWith<$Res> {
  _$FlashcardManifestCopyWithImpl(this._self, this._then);

  final FlashcardManifest _self;
  final $Res Function(FlashcardManifest) _then;

/// Create a copy of FlashcardManifest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? color = null,Object? groups = null,Object? items = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<FlashGroup>,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<FlashItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [FlashcardManifest].
extension FlashcardManifestPatterns on FlashcardManifest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlashcardManifest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlashcardManifest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlashcardManifest value)  $default,){
final _that = this;
switch (_that) {
case _FlashcardManifest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlashcardManifest value)?  $default,){
final _that = this;
switch (_that) {
case _FlashcardManifest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LocalizedText title,  String color,  List<FlashGroup> groups,  List<FlashItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlashcardManifest() when $default != null:
return $default(_that.id,_that.title,_that.color,_that.groups,_that.items);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LocalizedText title,  String color,  List<FlashGroup> groups,  List<FlashItem> items)  $default,) {final _that = this;
switch (_that) {
case _FlashcardManifest():
return $default(_that.id,_that.title,_that.color,_that.groups,_that.items);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LocalizedText title,  String color,  List<FlashGroup> groups,  List<FlashItem> items)?  $default,) {final _that = this;
switch (_that) {
case _FlashcardManifest() when $default != null:
return $default(_that.id,_that.title,_that.color,_that.groups,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlashcardManifest extends FlashcardManifest {
  const _FlashcardManifest({required this.id, required final  LocalizedText title, required this.color, final  List<FlashGroup> groups = const <FlashGroup>[], final  List<FlashItem> items = const <FlashItem>[]}): _title = title,_groups = groups,_items = items,super._();
  factory _FlashcardManifest.fromJson(Map<String, dynamic> json) => _$FlashcardManifestFromJson(json);

@override final  String id;
 final  LocalizedText _title;
@override LocalizedText get title {
  if (_title is EqualUnmodifiableMapView) return _title;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_title);
}

@override final  String color;
 final  List<FlashGroup> _groups;
@override@JsonKey() List<FlashGroup> get groups {
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groups);
}

 final  List<FlashItem> _items;
@override@JsonKey() List<FlashItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of FlashcardManifest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlashcardManifestCopyWith<_FlashcardManifest> get copyWith => __$FlashcardManifestCopyWithImpl<_FlashcardManifest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlashcardManifestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlashcardManifest&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._title, _title)&&(identical(other.color, color) || other.color == color)&&const DeepCollectionEquality().equals(other._groups, _groups)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_title),color,const DeepCollectionEquality().hash(_groups),const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'FlashcardManifest(id: $id, title: $title, color: $color, groups: $groups, items: $items)';
}


}

/// @nodoc
abstract mixin class _$FlashcardManifestCopyWith<$Res> implements $FlashcardManifestCopyWith<$Res> {
  factory _$FlashcardManifestCopyWith(_FlashcardManifest value, $Res Function(_FlashcardManifest) _then) = __$FlashcardManifestCopyWithImpl;
@override @useResult
$Res call({
 String id, LocalizedText title, String color, List<FlashGroup> groups, List<FlashItem> items
});




}
/// @nodoc
class __$FlashcardManifestCopyWithImpl<$Res>
    implements _$FlashcardManifestCopyWith<$Res> {
  __$FlashcardManifestCopyWithImpl(this._self, this._then);

  final _FlashcardManifest _self;
  final $Res Function(_FlashcardManifest) _then;

/// Create a copy of FlashcardManifest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? color = null,Object? groups = null,Object? items = null,}) {
  return _then(_FlashcardManifest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self._title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<FlashGroup>,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<FlashItem>,
  ));
}


}

// dart format on
