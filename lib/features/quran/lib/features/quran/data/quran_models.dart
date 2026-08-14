class QuranVerse {
  final int surahNumber;
  final int verseNumber;
  final String text;

  const QuranVerse({
    required this.surahNumber,
    required this.verseNumber,
    required this.text,
  });
}

class QuranSurah {
  final int number;
  final String name;
  final int verseCount;
  final bool isMeccan;

  const QuranSurah({
    required this.number,
    required this.name,
    required this.verseCount,
    required this.isMeccan,
  });
}
