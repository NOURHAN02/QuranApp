class Adan {
  final TimeAdan timeAdan;
  final DataAdan dataAdan;

  factory Adan.fromJson(Map<String, dynamic> json) {
    return Adan(
        timeAdan: TimeAdan.fromJson(json['timings']),
        dataAdan: DataAdan.fromJson(json['date']));
  }

  Adan({required this.timeAdan, required this.dataAdan});
}

class TimeAdan {
  final String Fajr;
  final String Sunrise;
  final String Dhuhr;
  final String Asr;
  final String Maghrib;
  final String Isha;
  final String Midnight;
  final String Lastthird;

  factory TimeAdan.fromJson(Map<String, dynamic> json) {
    return TimeAdan(
        Fajr: json['Fajr'],
        Sunrise: json['Sunrise'],
        Dhuhr: json['Dhuhr'],
        Asr: json['Asr'],
        Maghrib: json['Maghrib'],
        Isha: json['Isha'],
        Midnight: json['Midnight'],
        Lastthird: json['Lastthird']);
  }

  TimeAdan(
      {required this.Fajr,
      required this.Sunrise,
      required this.Dhuhr,
      required this.Asr,
      required this.Maghrib,
      required this.Isha,
      required this.Midnight,
      required this.Lastthird});
  Map<String, dynamic> toMap() => {
        Fajr: "Fajr",
        Sunrise: "Sunrise",
        Dhuhr: "Dhuhr",
        Asr: "Asr",
        Maghrib: "Maghrib",
        Isha: "Isha",
        Midnight: "Midnight",
        Lastthird: "Lastthird"
      };
}

class DataAdan {
  final String readable;

  factory DataAdan.fromJson(Map<String, dynamic> json) {
    return DataAdan(readable: json['readable']);
  }

  DataAdan({required this.readable});
}
