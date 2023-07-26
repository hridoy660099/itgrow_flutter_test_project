import 'dart:convert';
import 'dart:io';

import 'package:itgrow_flutter_test_project/data/app_exceptions.dart';
import 'package:itgrow_flutter_test_project/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:itgrow_flutter_test_project/res/app_constants.dart';
import 'package:itgrow_flutter_test_project/res/app_strings.dart';

class NetworkApiService extends BaseApiService {

  // POST --
  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      final response = await http
          .post(
        Uri.parse(url),
        headers: {
          AppStrings.accept: AppConstants.contentType,
          AppStrings.contentType: AppConstants.contentType,
          // AppStrings.authorization: '${AppStrings.bearer} $token',
        },
        body: data,
        encoding: Encoding.getByName(AppStrings.utf8),
      )
          .timeout(const Duration(seconds: 10));

      responseJson = _getResponse(response);
    } on SocketException {
      throw FetchDataException(AppStrings.noInternetConnection);
    }

    return responseJson;
  }

  // POST
  @override
  Future getPostApiTokenResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      final response = await http
          .post(
        Uri.parse(url),
        headers: {
          AppStrings.accept: "*/*",
          AppStrings.contentType: AppConstants.contentType,
          // AppStrings.authorization: '${AppStrings.bearer} $token',
        },
        body: data,
        encoding: Encoding.getByName(AppStrings.utf8),
      )
          .timeout(const Duration(seconds: 10));

      responseJson = _getResponse(response);
    } on SocketException {
      throw FetchDataException(AppStrings.noInternetConnection);
    }

    return responseJson;
  }

  // Text response
  @override
  Future getPostApiTokenTextResponse(String url, dynamic data) async {
    dynamic responseData;

    try {
      final response = await http
          .post(
        Uri.parse(url),
        headers: {
          AppStrings.accept: "*/*",
          AppStrings.contentType: AppConstants.contentType,
          // AppStrings.authorization: '${AppStrings.bearer} $token',
        },
        body: data,
        encoding: Encoding.getByName(AppStrings.utf8),
      )
          .timeout(const Duration(seconds: 10));

      responseData = _getStrResponse(response);
    } on SocketException {
      throw FetchDataException(AppStrings.noInternetConnection);
    }

    return responseData;
  }

  dynamic _getResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorizedException(response.body.toString());
      case 403:
        throw BadRequestException(response.body.toString());
      case 405:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException(
            "Error occurred while communicating with server with status code: ${response.statusCode}");
    }
  }

  dynamic _getStrResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        // dynamic responseJson = response.body;
        return response.body;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorizedException(response.body.toString());
      case 403:
        throw BadRequestException(response.body.toString());
      case 405:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException(
            "Error occurred while communicating with server with status code: ${response.statusCode}");
    }
  }
}
