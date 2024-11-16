import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran_app/core/error/errors.dart';
import 'package:quran_app/core/utils/service_api/service_api.dart';
import 'package:quran_app/feature/home/data/model/adan_model.dart';
import 'package:quran_app/feature/home/data/model/azkar_model.dart';
import 'package:quran_app/feature/home/data/model/quran_model.dart';
import 'package:quran_app/feature/home/data/model/surah_model.dart';
import 'package:quran_app/feature/home/data/repos/home_repo.dart';

class HomeRepoImp implements HomeRepo {
  final ServiceApi serviceApi;
  HomeRepoImp(this.serviceApi);
  @override
  Future<Either<Failure, List<QuranModel>>> fetchAllSurah() async {
    try {
      List<QuranModel> quran = [];
      var result = await serviceApi.get(endPoint: "quran/114_surah_data.json");
      for (var item in result) {
        quran.add(
          QuranModel.fromjson(item),
        );
      }
      return right(quran);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromjson(e));
      }
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SurahModel>>> fetchSurahDetails(
      {required int surahNum}) async {
    try {
      List<SurahModel> surah = [];
      var result = await serviceApi.getDetails(
          endPoint: "surah/$surahNum/editions/ar.alafasy#downloadJSON=true");

      for (var item in result) {
        surah.add(SurahModel.fromJson(item));
      }
      return Right(surah);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromjson(e));
      }

      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AzkarModel>>> fetchAllAzkar() async {
    try {
      List<AzkarModel> azkar = [];
      var result = await serviceApi.get(endPoint: "azkar/azkar.json");
      for (var item in result) {
        azkar.add(AzkarModel.fromJson(item));
      }
      return right(azkar);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromjson(e));
      }
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Adan>> fetchAdan(
      {required String data,
      required String latitude,
      required String longitude}) async {
    try {
      var result = await serviceApi.getAdan(
          endPoint:
              "timings/$data?latitude=$latitude&longitude=$longitude&method=1");
      Adan adan = Adan.fromJson(result);
      return right(adan);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromjson(e));
      }
      return left(ServerError(e.toString()));
    }
  }
}
