import 'quran_models.dart';

abstract class QuranRepository {
  Future<List<QuranSurah>> getSurahs();

  Future<List<QuranVerse>> getVerses(int surahNumber);

  Future<QuranVerse?> getVerse(
    int surahNumber,
    int verseNumber,
  );

  Future<List<QuranVerse>> search(String query);
}
