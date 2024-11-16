import 'dart:convert';
import 'package:dio/dio.dart';

class ServiceApi {
  final Dio dio;
  ServiceApi(this.dio);
  final String baseUrl =
      "https://raw.githubusercontent.com/Epic-Apps-Hub/Islamic-and-quran-data/main/";
  Future<List<dynamic>> get({required String endPoint}) async {
    var response = await dio.get("$baseUrl$endPoint");
    return jsonDecode(response.data);
  }

  Future<List<dynamic>> getDetails({required String endPoint}) async {
    Response response = await dio.get("https://api.alquran.cloud/v1/$endPoint");
    return response.data['data'];
  }

  Future<Map<String, dynamic>> getAdan({required String endPoint}) async {
    Response response = await dio.get("https://api.aladhan.com/v1/$endPoint");
    return response.data['data'];
  }
}
