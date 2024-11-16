/*
        "id": 1,
        "category": "جوامع الدعاء",
        "audio": "http://www.hisnmuslim.com/audio/ar/ar_7esn_AlMoslem_by_Doors_028.mp3",
        "filename": "ar_7esn_AlMoslem_by_Doors_028",
        "array": [{
                "id": 17,
                "text": "اللَّهمَّ إِنِّي ظَلَمْتُ نَفْسِي ظُلْمًا كثِيرًا، وَلا يَغْفِر الذُّنوبَ إِلَّا أَنْتَ، فَاغْفِر لي مغْفِرَةً مِن عِنْدِكَ، وَارحَمْني، إِنَّكَ أَنْتَ الْغَفور الرَّحِيم.",
                "count": 100,
                "audio": "http://www.hisnmuslim.com/audio/ar/91.mp3",
                "filename": "91"
            },
            {
                "id": 17,
                "text": "اللهم اجعل في قلبي نورًا، وفي بصري نورًا، وفي سمعي نورًا، وعن يميني نورًا، وعن يساري نورًا، وفوقي نورًا، وتحتي نورًا، وأمامي نورًا، وخلفي نورًا، واجعل لي نورًا.",
                "count": 100,
                "audio": "http://www.hisnmuslim.com/audio/ar/91.mp3",
                "filename": "91"
            },]
*/
class AzkarModel {
  final int id;
  final String category;
  final List<Array> array;

  AzkarModel({required this.id, required this.category, required this.array});
  factory AzkarModel.fromJson(json) {
    return AzkarModel(
      id: json['id'],
      category: json['category'],
      array:
          (json['array'] as List).map((item) => Array.fromJson(item)).toList(),
    );
  }
}

/*"id": 17,
                "text": "اللهم اجعل في قلبي نورًا، وفي بصري نورًا، وفي سمعي نورًا، وعن يميني نورًا، وعن يساري نورًا، وفوقي نورًا، وتحتي نورًا، وأمامي نورًا، وخلفي نورًا، واجعل لي نورًا.",
                "count": 100,
                "audio": "http://www.hisnmuslim.com/audio/ar/91.mp3",
                "filename": "91"*/
class Array {
  final int? id;
  final String text;
  final String audio;
  final int? count;

  Array(
      {required this.count,
      required this.id,
      required this.text,
      required this.audio});
  factory Array.fromJson(json) {
    return Array(
        id: json['id'] ?? 0,
        text: json['text'],
        audio: json['audio'],
        count: json['count'] ?? 0);
  }
  Map<String, dynamic> fromMap() {
    return {'id': id, 'text': text, 'audio': audio};
  }
}
