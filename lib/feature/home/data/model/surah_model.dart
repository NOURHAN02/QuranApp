/*
    "number": 1,
    "name": "سُورَةُ ٱلْفَاتِحَةِ",
    "englishName": "Al-Faatiha",
    "englishNameTranslation": "The Opening",
    "revelationType": "Meccan",
    "numberOfAyahs": 7,
    "ayahs": [
    {
    "number": 1,
    "audio": "https://cdn.islamic.network/quran/audio/128/ar.alafasy/1.mp3",
    "audioSecondary": [
    "https://cdn.islamic.network/quran/audio/64/ar.alafasy/1.mp3"
    ],
    "text": "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
    "numberInSurah": 1,
    "juz": 1,
    "manzil": 1,
    "page": 1,
    "ruku": 1,
    "hizbQuarter": 1,
    "sajda": false
    },
 */

class SurahModel {
  final int number;
  final int numberOfAyahs;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final List<AyahsModel> ayahs;

  SurahModel(
      {required this.number,
      required this.numberOfAyahs,
      required this.name,
      required this.englishName,
      required this.englishNameTranslation,
      required this.ayahs});
  factory SurahModel.fromJson(json) {
    return SurahModel(
      number: json["number"],
      numberOfAyahs: json['numberOfAyahs'],
      name: json['name'],
      englishName: json['englishName'],
      englishNameTranslation: json['englishNameTranslation'],
      ayahs: (json['ayahs'] as List)
          .map((ayahs) => AyahsModel.fromJson(ayahs))
          .toList(),
    );
  }
}

class AyahsModel {
  final int number;
  final int numberInSurah;
  final String audio;
  final String text;

  AyahsModel(
      {required this.number,
      required this.numberInSurah,
      required this.audio,
      required this.text});
  factory AyahsModel.fromJson(json) {
    return AyahsModel(
        number: json['number'],
        numberInSurah: json['numberInSurah'],
        audio: json['audio'],
        text: json['text']);
  }
}
