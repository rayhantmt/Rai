// core/network/exception.dart

class AppException implements Exception {
  final String message;
  final String? prefix;

  AppException([this.message = 'An unexpected error occurred', this.prefix]);

  @override
  String toString() {
    return '$prefix$message';
  }
}

// Specific exceptions
class BadRequestException extends AppException {
  BadRequestException([String message = 'Bad Request']) : super(message, 'Invalid Request: ');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String message = 'Unauthorized']) : super(message, 'Unauthorized: ');
}

class NotFoundException extends AppException {
  NotFoundException([String message = 'Not Found']) : super(message, 'Not Found: ');
}

class InternalServerException extends AppException {
  InternalServerException([String message = 'Internal Server Error']) : super(message, 'Server Error: ');
}

class FetchDataException extends AppException {
  FetchDataException([String message = 'No Internet Connection']) : super(message, 'Fetch Data Error: ');
}