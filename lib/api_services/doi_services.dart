import 'package:dio/dio.dart';
import 'package:rai/exceptions/app_exceptions.dart';


class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  Future<Response> postFormData({
    required String url,
    required FormData data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response?.statusCode;

        final errorMessage = _getErrorMessage(e.response?.data);

        switch (statusCode) {
          case 400:
            throw BadRequestException(errorMessage);
          case 401:
            throw UnauthorizedException(errorMessage);
          case 404:
            throw NotFoundException(errorMessage);
          case 500:
            throw InternalServerException(errorMessage);
          default:
            throw AppException(errorMessage);
        }
      } else {
        throw FetchDataException(
          'No Internet Connection or Server Unreachable',
        );
      }
    }
  }

  //  Helper to safely extract message regardless of format
  String _getErrorMessage(dynamic data) {
    if (data == null) return 'Unknown Error';

    // If data is a Map (JSON Object), look for 'message' or 'error'
    if (data is Map<String, dynamic>) {
      if (data.containsKey('message')) return data['message'].toString();
      if (data.containsKey('error')) return data['error'].toString();
      return data.toString(); // Fallback
    }

    // If data is a List (JSON Array), join them
    if (data is List) {
      return data.join('\n');
    }

    // If data is just a String
    return data.toString();
  }
}
