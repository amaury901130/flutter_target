import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiRequest {
  final String basePath;

  final String path;

  final Map<String, String>? header;

  final Map<String, dynamic>? parameters;

  Map<String, String> get _requestHeaders {
    //TODO: add default headers
    final Map<String, String> defaultHeaders = {
      'Content-Type': 'application/json',
    };
    if (header?.isNotEmpty ?? false) {
      defaultHeaders.addAll(header!);
    }

    return defaultHeaders;
  }

  http.Client get _client => http.Client();

  Uri get _url => Uri.https(basePath, path);

  ApiRequest({
    this.basePath = 'target-mvd-api.herokuapp.com/api/v1/',
    this.path = '',
    this.header,
    this.parameters,
  });

  Future<HttpResponse> get() async {
    var client = _client;
    try {
      http.Response response = await client.get(_url, headers: _requestHeaders);
      return _verifyResponse(response);
    } catch (e) {
      return HttpResponse(
        exception: HttpError(message: e.toString()),
      );
    } finally {
      client.close();
    }
  }

  Future<HttpResponse> post() async {
    var client = _client;
    try {
      http.Response response = await client.post(
        _url,
        body: parameters,
        headers: _requestHeaders,
      );
      return _verifyResponse(response);
    } catch (e) {
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
