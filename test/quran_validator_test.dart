import 'package:flutter_test/flutter_test.dart';
import 'package:quran_app/features/quran/data/quran_models.dart';
import 'package:quran_app/features/quran/data/quran_validator.dart';

void main() {
  const validator = QuranValidator();

  group('QuranValidator - Surahs', () {
    test('rejects data when the number of surahs is not 114', () {
      final result = validator.validateSurahs(const []);

      expect(result.isValid, isFalse);
      expect(
        result.errors,
        contains('يجب أن تحتوي بيانات السور على 114 سورة.'),
      );
    });

    test('rejects duplicated surah numbers', () {
      final surahs = List.generate(
        114,
        (index) => QuranSurah(
          number: index == 113 ? 113 : index + 1,
          name: 'سورة',
          verseCount: 1,
          isMeccan: true,
        ),
      );

      final result = validator.validateSurahs(surahs);

      expect(result.isValid, isFalse);
      expect(
        result.errors.any(
          (error) => error.contains('رقم السورة مكرر'),
        ),
        isTrue,
      );
    });
  });

  group('QuranValidator - Verses', () {
    test('rejects an empty verse text', () {
      const verses = [
        QuranVerse(
          surahNumber: 1,
          verseNumber: 1,
          text: '',
        ),
      ];

      final result = validator.validateVerses(1, verses);

      expect(result.isValid, isFalse);
      expect(
        result.errors.any(
          (error) => error.contains('لا تحتوي على نص'),
        ),
        isTrue,
      );
    });

    test('accepts valid verse structure', () {
      const verses = [
        QuranVerse(
          surahNumber: 1,
          verseNumber: 1,
          text: 'نص سيتم استبداله بالمصدر الموثوق',
        ),
      ];

      final result = validator.validateVerses(1, verses);

      expect(result.isValid, isTrue);
      expect(result.errors, isEmpty);
    });
  });
}
