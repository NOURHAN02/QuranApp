import 'package:dartz/dartz.dart';
import 'package:quran_app/core/error/errors.dart';
import 'package:quran_app/feature/home/data/model/adan_model.dart';
import 'package:quran_app/feature/home/data/model/azkar_model.dart';
import 'package:quran_app/feature/home/data/model/quran_model.dart';
import 'package:quran_app/feature/home/data/model/surah_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<QuranModel>>> fetchAllSurah();
  Future<Either<Failure, List<SurahModel>>> fetchSurahDetails(
      {required int surahNum});
  Future<Either<Failure, List<AzkarModel>>> fetchAllAzkar();
  Future<Either<Failure, Adan>> fetchAdan(
      {required String data,
      required String latitude,
      required String longitude});
}
