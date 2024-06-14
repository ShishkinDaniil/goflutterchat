import 'dart:io';

import 'package:dio/dio.dart';

bool isServerEternalError(Object error) {
  if (error is DioException && error.error is SocketException) {
    final socketErr = error.error;
    if (socketErr is SocketException) {
      final code = socketErr.osError?.errorCode;
      if (code == 101 || code == 111) {
        return true;
      }
    }
  }
  return false;
}
