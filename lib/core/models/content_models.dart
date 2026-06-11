import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_models.freezed.dart';
part 'content_models.g.dart';

/// Manifest values keyed by language code ('en', 'bn', 'ar').
typedef LocalizedText = Map<String, String>;

extension LocalizedTextX on LocalizedText {
  /// Falls back to English, then to any available value, so a missing
  /// translation never crashes a screen.
  String resolve(String languageCode) =>
      this[languageCode] ?? this['en'] ?? (values.isEmpty ? '' : values.first);
}

@freezed
abstract class WordExample with _$WordExample {
  const factory WordExample({
    required String word,
    required String image,
    required String audio,
  }) = _WordExample;

  factory WordExample.fromJson(Map<String, dynamic> json) =>
      _$WordExampleFromJson(json);
}

@freezed
abstract class LetterAudio with _$LetterAudio {
  const factory LetterAudio({
    required String name,
    String? phonic,
  }) = _LetterAudio;

  factory LetterAudio.fromJson(Map<String, dynamic> json) =>
      _$LetterAudioFromJson(json);
}

@freezed
abstract class Letter with _$Letter {
  const factory Letter({
    required String id,
    required String glyph,
    String? lowercase,
    required String name,
    required LetterAudio audio,
    @Default(<WordExample>[]) List<WordExample> examples,
  }) = _Letter;

  factory Letter.fromJson(Map<String, dynamic> json) => _$LetterFromJson(json);
}

@freezed
abstract class AlphabetTrack with _$AlphabetTrack {
  const factory AlphabetTrack({
    required String id,
    required LocalizedText title,
    @Default(<Letter>[]) List<Letter> letters,
  }) = _AlphabetTrack;

  factory AlphabetTrack.fromJson(Map<String, dynamic> json) =>
      _$AlphabetTrackFromJson(json);
}

@freezed
abstract class AlphabetManifest with _$AlphabetManifest {
  const AlphabetManifest._();

  const factory AlphabetManifest({
    required String id,
    required LocalizedText title,
    required String color,
    @Default('ltr') String direction,
    @Default('latin') String script,
    @Default(false) bool hasCaseToggle,
    @Default(<AlphabetTrack>[]) List<AlphabetTrack> tracks,
  }) = _AlphabetManifest;

  factory AlphabetManifest.fromJson(Map<String, dynamic> json) =>
      _$AlphabetManifestFromJson(json);

  bool get isRtl => direction == 'rtl';

  /// All letters across tracks, in manifest order.
  List<Letter> get allLetters =>
      [for (final track in tracks) ...track.letters];
}

@freezed
abstract class FlashGroup with _$FlashGroup {
  const factory FlashGroup({
    required String id,
    required LocalizedText title,
    String? icon,
  }) = _FlashGroup;

  factory FlashGroup.fromJson(Map<String, dynamic> json) =>
      _$FlashGroupFromJson(json);
}

@freezed
abstract class FlashItem with _$FlashItem {
  const factory FlashItem({
    required String id,
    required String group,
    required LocalizedText names,
    String? icon,
    String? photo,
    String? illustration,
    String? sound,
    @Default(<String, String>{}) Map<String, String> nameAudio,
  }) = _FlashItem;

  factory FlashItem.fromJson(Map<String, dynamic> json) =>
      _$FlashItemFromJson(json);
}

@freezed
abstract class FlashcardManifest with _$FlashcardManifest {
  const FlashcardManifest._();

  const factory FlashcardManifest({
    required String id,
    required LocalizedText title,
    required String color,
    @Default(<FlashGroup>[]) List<FlashGroup> groups,
    @Default(<FlashItem>[]) List<FlashItem> items,
  }) = _FlashcardManifest;

  factory FlashcardManifest.fromJson(Map<String, dynamic> json) =>
      _$FlashcardManifestFromJson(json);

  List<FlashItem> itemsInGroup(String? groupId) => groupId == null
      ? items
      : items.where((item) => item.group == groupId).toList();
}
