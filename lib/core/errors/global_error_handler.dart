import 'package:dio/dio.dart';

class GlobalErrorHandler {
  int? statusCode;
  String? message;

  GlobalErrorHandler.fromDioException(DioException dioError) {
    statusCode = dioError.response?.statusCode;

    if (dioError.response?.data != null) {
      if (dioError.response?.data is Map<String, dynamic> &&
          dioError.response?.data['message'] != null) {
        message = dioError.response?.data['message'];
      } else {
        message = "An unexpected error occurred.";
      }
    } else {
      switch (dioError.type) {
        case DioExceptionType.connectionTimeout:
          message = "Connection timeout. Please try again.";
          break;
        case DioExceptionType.sendTimeout:
          message = "Request timeout. Please try again.";
          break;
        case DioExceptionType.receiveTimeout:
          message = "Response timeout. Please try again.";
          break;
        case DioExceptionType.cancel:
          message = "Request cancelled by the user.";
          break;
        case DioExceptionType.unknown:
          message = "An unexpected error occurred: ${dioError.message}";
          break;
        default:
          message = "An unexpected error occurred.";
      }
    }
  }

  GlobalErrorHandler.fromException(Exception exception) {
    statusCode = 500;
    message = exception.toString();
  }

  @override
  String toString() {
    return 'GlobalErrorHandler{statusCode: $statusCode, message: $message}';
  }
}

