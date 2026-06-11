// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WordExample _$WordExampleFromJson(Map<String, dynamic> json) => _WordExample(
  word: json['word'] as String,
  image: json['image'] as String,
  audio: json['audio'] as String,
);

Map<String, dynamic> _$WordExampleToJson(_WordExample instance) =>
    <String, dynamic>{
      'word': instance.word,
      'image': instance.image,
      'audio': instance.audio,
    };

_LetterAudio _$LetterAudioFromJson(Map<String, dynamic> json) => _LetterAudio(
  name: json['name'] as String,
  phonic: json['phonic'] as String?,
);

Map<String, dynamic> _$LetterAudioToJson(_LetterAudio instance) =>
    <String, dynamic>{'name': instance.name, 'phonic': instance.phonic};

_Letter _$LetterFromJson(Map<String, dynamic> json) => _Letter(
  id: json['id'] as String,
  glyph: json['glyph'] as String,
  lowercase: json['lowercase'] as String?,
  name: json['name'] as String,
  audio: LetterAudio.fromJson(json['audio'] as Map<String, dynamic>),
  examples:
      (json['examples'] as List<dynamic>?)
          ?.map((e) => WordExample.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <WordExample>[],
);

Map<String, dynamic> _$LetterToJson(_Letter instance) => <String, dynamic>{
  'id': instance.id,
  'glyph': instance.glyph,
  'lowercase': instance.lowercase,
  'name': instance.name,
  'audio': instance.audio,
  'examples': instance.examples,
};

_AlphabetTrack _$AlphabetTrackFromJson(Map<String, dynamic> json) =>
    _AlphabetTrack(
      id: json['id'] as String,
      title: Map<String, String>.from(json['title'] as Map),
      letters:
          (json['letters'] as List<dynamic>?)
              ?.map((e) => Letter.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Letter>[],
    );

Map<String, dynamic> _$AlphabetTrackToJson(_AlphabetTrack instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'letters': instance.letters,
    };

_AlphabetManifest _$AlphabetManifestFromJson(Map<String, dynamic> json) =>
    _AlphabetManifest(
      id: json['id'] as String,
      title: Map<String, String>.from(json['title'] as Map),
      color: json['color'] as String,
      direction: json['direction'] as String? ?? 'ltr',
      script: json['script'] as String? ?? 'latin',
      hasCaseToggle: json['hasCaseToggle'] as bool? ?? false,
      tracks:
          (json['tracks'] as List<dynamic>?)
              ?.map((e) => AlphabetTrack.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AlphabetTrack>[],
    );

Map<String, dynamic> _$AlphabetManifestToJson(_AlphabetManifest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'color': instance.color,
      'direction': instance.direction,
      'script': instance.script,
      'hasCaseToggle': instance.hasCaseToggle,
      'tracks': instance.tracks,
    };

_FlashGroup _$FlashGroupFromJson(Map<String, dynamic> json) => _FlashGroup(
  id: json['id'] as String,
  title: Map<String, String>.from(json['title'] as Map),
  icon: json['icon'] as String?,
);

Map<String, dynamic> _$FlashGroupToJson(_FlashGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'icon': instance.icon,
    };

_FlashItem _$FlashItemFromJson(Map<String, dynamic> json) => _FlashItem(
  id: json['id'] as String,
  group: json['group'] as String,
  names: Map<String, String>.from(json['names'] as Map),
  icon: json['icon'] as String?,
  photo: json['photo'] as String?,
  illustration: json['illustration'] as String?,
  sound: json['sound'] as String?,
  nameAudio:
      (json['nameAudio'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ) ??
      const <String, String>{},
);

Map<String, dynamic> _$FlashItemToJson(_FlashItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group': instance.group,
      'names': instance.names,
      'icon': instance.icon,
      'photo': instance.photo,
      'illustration': instance.illustration,
      'sound': instance.sound,
      'nameAudio': instance.nameAudio,
    };

_FlashcardManifest _$FlashcardManifestFromJson(Map<String, dynamic> json) =>
    _FlashcardManifest(
      id: json['id'] as String,
      title: Map<String, String>.from(json['title'] as Map),
      color: json['color'] as String,
      groups:
          (json['groups'] as List<dynamic>?)
              ?.map((e) => FlashGroup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <FlashGroup>[],
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => FlashItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <FlashItem>[],
    );

Map<String, dynamic> _$FlashcardManifestToJson(_FlashcardManifest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'color': instance.color,
      'groups': instance.groups,
      'items': instance.items,
    };
