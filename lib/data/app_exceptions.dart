
import 'package:itgrow_flutter_test_project/res/app_constants.dart';

class AppException implements Exception{
  final _prefix;
  final _message;

  AppException([this._prefix, this._message]);

  @override
  String toString() {
    return "$_prefix $_message";
  }
}

class FetchDataException extends AppException{
  FetchDataException([String? message]) : super(AppConstants.fetchDataExceptionPrefix, message);
}

class BadRequestException extends AppException{
  BadRequestException([String? message]) : super(AppConstants.badRequestExceptionPrefix, message);
}

class UnauthorizedException extends AppException{
  UnauthorizedException([String? message]) : super(AppConstants.unauthorizedExceptionPrefix, message);
}

class InvalidInputException extends AppException{
  InvalidInputException([String? message]) : super(AppConstants.invalidInputExceptionPrefix, message);
}