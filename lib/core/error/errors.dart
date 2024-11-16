import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  Failure(this.errorMessage);
}

class ServerError extends Failure {
  ServerError(super.errorMessage);
  factory ServerError.fromjson(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerError("connectionTimeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerError("sendTimeout with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerError("receiveTimeout with ApiServer");
      case DioExceptionType.badCertificate:
        return ServerError("badCertificate with ApiServer");
      case DioExceptionType.badResponse:
        return ServerError.fromResponse(
            error.response!.statusCode, error.response!.data);
      case DioExceptionType.cancel:
        return ServerError("Request to ApiServer was canceld");
      case DioExceptionType.connectionError:
        return ServerError(" No Internet Connection");
      case DioExceptionType.unknown:
        return ServerError("unknown error in ApiServer , Please try again");

      default:
        return ServerError('Opps There was an Error, Please try again');
    }
  }
  factory ServerError.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerError("response Error");
    } else if (statusCode == 404) {
      return ServerError('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerError('Internal Server error, Please try later');
    } else {
      return ServerError('Opps There was an Error, Please try again');
    }
  }
}
