// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:io';

import 'package:app_core/init_core.dart';
import 'package:app_core/src/enums/enums.dart';
import 'package:app_core/src/services/services.dart';
import 'package:dio/dio.dart';

const int DEFAULT_QTD_TRIES = 1;
const DEFAULT_TIMEOUT_TIME = Duration(minutes: 1);

class HttpClientServiceImpl extends HttpClientService {
  Map<ApiName, String> urls = {};

  HttpClientServiceImpl() : super() {
    urls = I.getDependency<FlavorService>().getUrlBase();
  }

  ConnectivityService connectivityService = I.getDependency<ConnectivityService>();
  StorageService storageService = I.getDependency<StorageService>();
  final Dio client = Dio();

  @override
  Future<Response?> request({
    required ApiName apiName,
    required String endpoint,
    required RequestMethod method,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final Response? response;
    final hasConnection = await connectivityService.hasConnection();

    if (!hasConnection) {
      // add no connection return
      response = Response(
        statusCode: StatusCodes.noConnection.value,
        statusMessage: StatusCodes.noConnection.defaultMessage,
        requestOptions: RequestOptions(),
      );
    } else {
      String url = apiName.name + endpoint;
      response = await tryRequest(method, url, body: body, headers: headers);
    }
    return response;
  }

  Future<Response?> tryRequest(
    RequestMethod method,
    String url, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    Response? resp;
    for (var i = 0; i < DEFAULT_QTD_TRIES; i++) {
      try {
        resp = await makeRequest(method, url, headers: headers, body: body).timeout(DEFAULT_TIMEOUT_TIME);
      } on TimeoutException catch (_) {
        // A timeout occurred.
        resp = _onTimeout();
      } on SocketException catch (_) {
        // Other exception
        _onInternetFailed();
      }
      if (resp != null) break;
    }

    if (resp == null) return null;
    try {
      return resp;
    } catch (e) {
      return null;
    }
  }

  void sendLogError(Response resp) {
    logger.error('${resp.requestOptions.uri.toString()} - ${resp.statusCode}');
    // TODO: add send log error
  }

  Future<Map<String, String>> getDefaultHeaders({bool withToken = true}) async {
    String? token = await storageService.getToken();

    Map<String, String> map = {
      'Content-Type': "application/json; charset=utf-8",
      'accept': 'application/json, text/plain, */*',
    };
    if (token != null && token.isNotEmpty) map['Authorization'] = 'Bearer $token';
    return map;
  }

  Response _onTimeout() {
    logger.error('TIMEOUT!');
    return Response(
      statusMessage: 'Timeout',
      statusCode: 408,
      requestOptions: RequestOptions(path: ''),
    );
  }

  void _onInternetFailed() {
    logger.error('CONNECTION FAILED!');
  }

  Future<Response?> makeRequest(
    RequestMethod method,
    String url, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    logger.info('$method - $url');
    headers ??= await getDefaultHeaders();
    Options options = Options(headers: headers);

    Response? resp;
    try {
      switch (method) {
        case RequestMethod.get:
          resp = await client.get(url, options: options);
          break;
        case RequestMethod.post:
          resp = await client.post(url, options: options, data: body);
          break;
        case RequestMethod.delete:
          resp = await client.delete(url, options: options);
          break;
        case RequestMethod.put:
          resp = await client.put(url, options: options, data: body);
          break;
        default:
          throw const SocketException('METHOD NOT SUPPORTED');
      }
    } on DioException catch (e) {
      StatusCodes statusCode = StatusCodes.unkown;
      var data = {};
      if (e.response != null) {
        data = e.response!.data is String
            ? e.response!.data.isNotEmpty
                ? {"message": e.response!.data}
                : {}
            : e.response!.data ?? {};

        statusCode = getStatusCode(e.response?.statusCode);

        resp = Response(
          statusMessage: statusCode.defaultMessage,
          statusCode: statusCode.value,
          data: data,
          headers: e.response?.headers,
          requestOptions: e.response?.requestOptions ?? RequestOptions(path: ''),
        );
        sendLogError(resp);
      }
    }
    return resp;
  }
}
