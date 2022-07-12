import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:greggs/app/utils/global.dart';
import 'package:greggs/data/network/app_exception.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  final String _baseUrl = 'https://api/';

  Future<http.Response> get(String url) async {
    try {
      final response = await http.get(
        Uri.parse(_baseUrl + url),
      );

      Global.printResponse('GET', response);
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  http.Response _returnResponse(http.Response response) {
    Map body = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException(body['message']);
      case 401:
        throw UnauthorisedException(body['message']);
      case 403:
        throw UnauthorisedException(body['message']);
      case 404:
        throw BadRequestException('Not found');
      case 500:
        throw FetchDataException('Internal Server Error');
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
