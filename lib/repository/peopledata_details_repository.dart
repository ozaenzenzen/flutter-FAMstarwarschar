import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:soal_16_starwarsapi/model/peopledata_details_response.dart';
import 'package:soal_16_starwarsapi/utils/urls.dart';

class PeopleDataDetailsRepository {
  final _dio = Dio();
  Future<Either<String, PeopleDataDetailsResponse>> getPeopleDataDetails(
      String id) async {
    Response _response;

    try {
      _response = await _dio.get(
        Urls.BASE_API + "people/$id",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      PeopleDataDetailsResponse _peopleDataDetailsResponse =
          PeopleDataDetailsResponse.fromJson(_response.data);
      return right(_peopleDataDetailsResponse);
    } on DioError catch (e) {
      String errorMessage = e.response!.data.toString();

      switch (e.type) {
        case DioErrorType.connectTimeout:
          break;
        case DioErrorType.sendTimeout:
          break;
        case DioErrorType.receiveTimeout:
          break;
        case DioErrorType.response:
          errorMessage = e.response!.data['message'];
          break;
        case DioErrorType.cancel:
          break;
        case DioErrorType.other:
          break;
      }

      return left(errorMessage);
    }
  }
}
