import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rootstrap_target/globals/preferences.dart';

class ApiRequest {
  final String basePath;

  final String path;

  final Map<String, String> header;

  final Map<String, dynamic>? parameters;

  Map<String, String> get _requestHeaders {
    final defaultHeaders = <String, String>{};
    defaultHeaders.addAll(header);
    defaultHeaders.addAll(Preferences.instance.secureHeaders);

    if (defaultHeaders.isEmpty) {
      defaultHeaders['Content-Type'] = 'application/json';
    }

    return defaultHeaders;
  }

  http.Client get _client => http.Client();

  Uri get _url => Uri.https(basePath, '/api/v1/$path');

  ApiRequest({
    this.basePath = 'target-mvd-api.herokuapp.com',
    this.path = '',
    this.header = const {},
    this.parameters,
  });

  Future<HttpResponse> get() async {
    var client = _client;
    try {
      http.Response response = await client.get(
        _url,
        headers: _requestHeaders,
      );
      print(response.body);
      return _verifyResponse(response);
    } catch (e) {
      print(e.toString());
      return HttpResponse(
        exception: HttpError(message: e.toString()),
      );
    } finally {
      client.close();
    }
  }

  Future<HttpResponse> post() async {
    var client = _client;
    print(_requestHeaders);
    try {
      http.Response response = await client.post(
        _url,
        body: jsonEncode(parameters),
        headers: _requestHeaders,
      );
      print(response.body);
      return _verifyResponse(response);
    } catch (e) {
      print(e.toString());
      return HttpResponse(
        exception: HttpError(message: e.toString()),
      );
    } finally {
      client.close();
    }
  }

  HttpResponse _verifyResponse(http.Response response) {
    if (response.isSuccess) {
      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      final remoteHeaders = response.headers;
      if (remoteHeaders.containsKey('access-token')) {
        final savedHeaders = {
          'Content-Type': 'application/json',
          'access-token': remoteHeaders['access-token']!,
          'client': remoteHeaders['client']!,
          'expiry': remoteHeaders['expiry']!,
          'uid': remoteHeaders['uid']!,
        };
        Preferences.instance.secureHeaders = savedHeaders;
      }
      return HttpResponse(data: decodedResponse);
    }

    return HttpResponse(
      exception: HttpError(
        errorCode: response.statusCode,
      ),
    );
  }
}

extension UtilResponse on http.Response {
  bool get isSuccess => statusCode >= 200 && statusCode < 300;
}

class HttpResponse {
  final dynamic data;
  final HttpError? exception;

  const HttpResponse({this.data, this.exception});

  bool get isSuccess => exception == null;
}

class HttpError {
  final int? errorCode;
  final String? message;

  const HttpError({this.errorCode, this.message});
}
