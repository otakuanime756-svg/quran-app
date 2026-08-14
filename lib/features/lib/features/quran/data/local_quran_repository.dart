import 'quran_models.dart';
import 'quran_repository.dart';

class LocalQuranRepository implements QuranRepository {
  const LocalQuranRepository();

  @override
  Future<List<QuranSurah>> getSurahs() async {
    // سيتم تحميل بيانات السور من مصدر القرآن الموثوق لاحقًا.
    return const [];
  }

  @override
  Future<List<QuranVerse>> getVerses(int surahNumber) async {
    // سيتم تحميل الآيات من قاعدة البيانات المحلية بعد التحقق منها.
    return const [];
  }

  @override
  Future<QuranVerse?> getVerse(
    int surahNumber,
    int verseNumber,
  ) async {
    final verses = await getVerses(surahNumber);

    for (final verse in verses) {
      if (verse.verseNumber == verseNumber) {
        return verse;
      }
    }

    return null;
  }

  @override
  Future<List<QuranVerse>> search(String query) async {
    // البحث سيُربط بقاعدة بيانات القرآن بعد إدخال المصدر الموثوق.
    return const [];
  }
}
