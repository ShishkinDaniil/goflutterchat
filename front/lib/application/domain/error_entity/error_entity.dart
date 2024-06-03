import 'package:dio/dio.dart';

class ErrorEntity {
  final String message;
  final String? errorMessage;
  final dynamic error;
  final StackTrace? stackTrace;

  ErrorEntity({
    required this.message,
    this.errorMessage,
    this.error,
    this.stackTrace,
  });
  factory ErrorEntity.fromException(dynamic error) {
    if (error is ErrorEntity) return error;
    final entity = ErrorEntity(
      message: "Неизвестная ошибка",
    );
    if (error is DioException) {
      try {
        print(error.response?.data);
        print(error.response?.data);

        return ErrorEntity(
          message: error.response?.data['error'] ?? "Неизвестная ошибка",
          stackTrace: error.stackTrace,
          error: error,
        );
      } catch (error) {
        return entity;
      }
    }
    return entity;
  }
}