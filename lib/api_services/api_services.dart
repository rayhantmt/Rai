import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rai/api_services/api_config.dart';
import 'package:rai/exceptions/app_exceptions.dart';


class ApiService {
  /// POST Request
  static Future<dynamic> post({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse('${ApiConfig.baseUrl}$endpoint');

    try {
      final response = await http.post(
        uri,
        headers: headers ?? {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      print('🔁 [POST] $uri');
      print('Request Body: ${jsonEncode(body)}');
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      switch (response.statusCode) {
        case 200:
        case 201:
          return jsonDecode(response.body);
        case 400:
          final error = jsonDecode(response.body)['message'] ?? 'Bad Request';
          throw BadRequestException(error);
        case 401:
        case 403:
          final error = jsonDecode(response.body)['message'] ?? 'Unauthorized';
          throw UnauthorizedException(error);
        case 404:
          final error = jsonDecode(response.body)['message'] ?? 'Not Found';
          throw NotFoundException(error);
        case 500:
        default:
          throw InternalServerException(response.body);
      }
    } catch (e) {
      throw FetchDataException(e.toString());
    }
  }

  /// PUT Request
  static Future<dynamic> put({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse('${ApiConfig.baseUrl}$endpoint');

    try {
      final response = await http.put(
        uri,
        headers: headers ?? {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      print('🔁 [PUT] $uri');
      print('Request Body: ${jsonEncode(body)}');
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      switch (response.statusCode) {
        case 200:
        case 201:
          return jsonDecode(response.body);
        case 400:
          throw BadRequestException(response.body);
        case 401:
        case 403:
          throw UnauthorizedException(response.body);
        case 404:
          throw NotFoundException("Server offline");
        case 500:
        default:
          throw InternalServerException(response.body);
      }
    } catch (e) {
      throw FetchDataException(e.toString());
    }
  }

  /// PATCH Request
  static Future<dynamic> patch({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse('${ApiConfig.baseUrl}$endpoint');

    try {
      final response = await http.patch(
        uri,
        headers: headers ?? {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      print('🔁 [PATCH] $uri');
      print('Request Body: ${jsonEncode(body)}');
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      switch (response.statusCode) {
        case 200:
        case 204:
          return response.body.isNotEmpty ? jsonDecode(response.body) : {};
        case 400:
          throw BadRequestException(response.body);
        case 401:
        case 403:
          throw UnauthorizedException(response.body);
        case 404:
          throw NotFoundException(response.body);
        case 500:
        default:
          throw InternalServerException(response.body);
      }
    } catch (e) {
      throw FetchDataException(e.toString());
    }
  }

  /// GET Request
  static Future<dynamic> get({
    required String endpoint,
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse('${ApiConfig.baseUrl}$endpoint');

    try {
      final response = await http.get(
        uri,
        headers: headers ?? {'Content-Type': 'application/json'},
      );
      print('🔁 [GET] $uri');
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      switch (response.statusCode) {
        case 200:
        case 201:
          return jsonDecode(response.body);
        case 400:
          final error = jsonDecode(response.body)['message'] ?? 'Bad Request';
          throw BadRequestException(error);
        case 401:
        case 403:
          final error = jsonDecode(response.body)['message'] ?? 'Unauthorized';
          throw UnauthorizedException(error);
        case 404:
          final error = jsonDecode(response.body)['message'] ?? 'Not Found';
          throw NotFoundException(error);
        case 500:
        default:
          throw InternalServerException(response.body);
      }
    } catch (e) {
      throw FetchDataException(e.toString());
    }
  }

  /// DELETE Request
  static Future<dynamic> delete({
    required String endpoint,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final uri = Uri.parse('${ApiConfig.baseUrl}$endpoint');

    try {
      final response = await http.delete(
        uri,
        headers: headers ?? {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      print('🗑️ [DELETE] $uri');
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      switch (response.statusCode) {
        case 200:
        case 204:
          return response.body.isNotEmpty ? jsonDecode(response.body) : {};
        case 400:
          final error = jsonDecode(response.body)['message'] ?? 'Bad Request';
          throw BadRequestException(error);
        case 401:
        case 403:
          final error = jsonDecode(response.body)['message'] ?? 'Unauthorized';
          throw UnauthorizedException(error);
        case 404:
          final error = jsonDecode(response.body)['message'] ?? 'Not Found';
          throw NotFoundException(error);
        case 500:
        default:
          throw InternalServerException(response.body);
      }
    } catch (e) {
      throw FetchDataException(e.toString());
    }
  }
}