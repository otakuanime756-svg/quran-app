import 'quran_models.dart';

class QuranValidationResult {
  final bool isValid;
  final List<String> errors;

  const QuranValidationResult({
    required this.isValid,
    required this.errors,
  });

  factory QuranValidationResult.valid() {
    return const QuranValidationResult(
      isValid: true,
      errors: [],
    );
  }

  factory QuranValidationResult.invalid(List<String> errors) {
    return QuranValidationResult(
      isValid: false,
      errors: List.unmodifiable(errors),
    );
  }
}

class QuranValidator {
  const QuranValidator();

  QuranValidationResult validateSurahs(
    List<QuranSurah> surahs,
  ) {
    final errors = <String>[];

    if (surahs.length != 114) {
      errors.add(
        'يجب أن تحتوي بيانات السور على 114 سورة.',
      );
    }

    final numbers = <int>{};

    for (final surah in surahs) {
      if (surah.number < 1 || surah.number > 114) {
        errors.add(
          'رقم السورة غير صالح: ${surah.number}',
        );
      }

      if (!numbers.add(surah.number)) {
        errors.add(
          'رقم السورة مكرر: ${surah.number}',
        );
      }

      if (surah.name.trim().isEmpty) {
        errors.add(
          'السورة رقم ${surah.number} لا تحتوي على اسم.',
        );
      }

      if (surah.verseCount <= 0) {
        errors.add(
          'عدد آيات السورة ${surah.number} غير صالح.',
        );
      }
    }

    return errors.isEmpty
        ? QuranValidationResult.valid()
        : QuranValidationResult.invalid(errors);
  }

  QuranValidationResult validateVerses(
    int surahNumber,
    List<QuranVerse> verses,
  ) {
    final errors = <String>[];

    if (surahNumber < 1 || surahNumber > 114) {
      errors.add(
        'رقم السورة غير صالح: $surahNumber',
      );
    }

    final numbers = <int>{};

    for (final verse in verses) {
      if (verse.surahNumber != surahNumber) {
        errors.add(
          'الآية ${verse.verseNumber} مرتبطة بالسورة الخطأ.',
        );
      }

      if (verse.verseNumber <= 0) {
        errors.add(
          'رقم الآية غير صالح: ${verse.verseNumber}',
        );
      }

      if (!numbers.add(verse.verseNumber)) {
        errors.add(
          'رقم الآية مكرر: ${verse.verseNumber}',
        );
      }

      if (verse.text.trim().isEmpty) {
        errors.add(
          'الآية ${verse.verseNumber} لا تحتوي على نص.',
        );
      }
    }

    return errors.isEmpty
        ? QuranValidationResult.valid()
        : QuranValidationResult.invalid(errors);
  }
}
