/*      "id": 1,
         "name": "Al Fatiha",
         "aya": 7,
         "english": "The Opening",
         "turkish": "Fâtiha",
         "place": "Makkah",
         "arabic": "الفاتحة"
         */
class QuranModel {
  final int id;
  final String name;
  final int aya;
  final String english;
  final String arabic;

  QuranModel(
      {required this.id,
      required this.name,
      required this.aya,
      required this.english,
      required this.arabic});

  factory QuranModel.fromjson(json) {
    return QuranModel(
        id: json['id'],
        name: json['name'],
        aya: json['aya'],
        english: json['english'],
        arabic: json['arabic']);
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "aya": aya,
        "english": english,
        "arabic": arabic
      };
}
