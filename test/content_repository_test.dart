import 'package:flutter_test/flutter_test.dart';
import 'package:little_letters/content/content_repository.dart';
import 'package:little_letters/core/models/content_models.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final repository = ContentRepository();

  group('english manifest', () {
    test('parses 26 letters with audio and examples', () async {
      final manifest = await repository.loadAlphabet('english');
      expect(manifest.id, 'english');
      expect(manifest.hasCaseToggle, isTrue);
      expect(manifest.isRtl, isFalse);

      final letters = manifest.allLetters;
      expect(letters, hasLength(26));
      for (final letter in letters) {
        expect(letter.glyph, isNotEmpty);
        expect(letter.lowercase, isNotNull);
        expect(letter.audio.name, startsWith('assets/audio/'));
        expect(letter.audio.phonic, isNotNull);
        expect(letter.examples.length, inInclusiveRange(3, 5));
      }
    });

    test('title resolves with English fallback', () async {
      final manifest = await repository.loadAlphabet('english');
      expect(manifest.title.resolve('bn'), 'ইংরেজি বর্ণমালা');
      expect(manifest.title.resolve('xx'), 'English Alphabets');
    });
  });

  group('vehicles manifest', () {
    test('parses 30 items across 6 groups with trilingual names', () async {
      final manifest = await repository.loadFlashcards('vehicles');
      expect(manifest.id, 'vehicles');
      expect(manifest.groups, hasLength(6));
      expect(manifest.items, hasLength(30));

      final groupIds = manifest.groups.map((g) => g.id).toSet();
      for (final item in manifest.items) {
        expect(groupIds, contains(item.group));
        for (final lang in const ['en', 'bn', 'ar']) {
          expect(item.names[lang], isNotEmpty,
              reason: '${item.id} missing $lang name');
        }
      }
    });

    test('itemsInGroup filters and null means all', () async {
      final manifest = await repository.loadFlashcards('vehicles');
      final road = manifest.itemsInGroup('road');
      expect(road, isNotEmpty);
      expect(road.every((item) => item.group == 'road'), isTrue);
      expect(manifest.itemsInGroup(null), hasLength(30));
    });
  });
}
