import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:eng_mobile_app/data/network/mockserver.dart';
import 'package:eng_mobile_app/services/auth/auth_service.dart';
import 'package:eng_mobile_app/config.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:get_it/get_it.dart';

class Response {
  bool ok;
  dynamic data;

  Response({required this.ok, this.data});
}

class Network {
  int timeout;
  String apiURL;
  final _authService = GetIt.I.get<AuthService>();

  Network({this.timeout = 60 * 1000, this.apiURL = Config.API_URL});

  Future<Response> get(String path,
      {bool showErrorMsg = true, bool internetError = true}) async {
    try {
      printInfo('REQUEST -->>> | GET | $path');

      int statusCode = 0;
      String reply = '';

      if (Config.MOCK) {
        final mockResp = await MockServer(path).get();
        reply = mockResp.data;
        statusCode = mockResp.statusCode;
      } else {
        final httpClient = HttpClient();
        HttpClientRequest request =
            await httpClient.getUrl(Uri.parse(apiURL + path));
        request.headers.set('content-type', 'application/json');
        // request.headers.set('Authorization', 'Bearer ${_authService.token}');
        HttpClientResponse response =
            await request.close().timeout(Duration(milliseconds: timeout));
        reply = await response.transform(utf8.decoder).join();
        statusCode = response.statusCode;
        httpClient.close();
      }

      if (authErrorHandler(statusCode, path)) return Response(ok: false);

      if (serverErrorHandler(reply, statusCode, path, 'get', showErrorMsg)) {
        return Response(ok: false);
      }

      final data = reply != '' ? jsonDecode(reply) : '';
      log(reply);

      printDebug('RESPONSE <<<-- | $statusCode | $path | $data');
      return Response(ok: true, data: data);
    } on TimeoutException catch (_) {
      printError('Network --> get($path) | Server connection timed out');
      return Response(ok: false);
    } on SocketException catch (_) {
      printError("Network --> get($path) | You aren't connected to internet");
      return Response(ok: false);
    } catch (e, s) {
      printError("Network --> get($path) | Connection Lost");
      printError(e.toString());
      printError(s.toString());
      return Response(ok: false);
    }
  }

  Future<Response> post(path, {required data, bool showErrorMsg = true}) async {
    try {
      final payload = data;

      printInfo('REQUEST -->>> | POST | $path | $payload');

      int statusCode = 0;
      String reply = '';

      if (Config.MOCK) {
        final mockResp = await MockServer(path).post(payload);
        reply = mockResp.data;
        statusCode = mockResp.statusCode;
      } else {
        final httpClient = HttpClient();
        HttpClientRequest request =
            await httpClient.postUrl(Uri.parse(apiURL + path));
        request.headers.set('content-type', 'application/json');
        request.headers.set('Authorization', 'Bearer ${_authService.token}');
        request.headers.contentLength =
            utf8.encode(json.encode(payload)).length;
        request.add(utf8.encode(json.encode(payload)));
        HttpClientResponse response =
            await request.close().timeout(Duration(milliseconds: timeout));
        reply = await response.transform(utf8.decoder).join();
        statusCode = response.statusCode;
        httpClient.close();
      }

      if (authErrorHandler(statusCode, path)) return Response(ok: false);

      if (serverErrorHandler(reply, statusCode, path, 'post', showErrorMsg)) {
        return Response(ok: false);
      }

      final jsonData = reply != '' ? jsonDecode(reply) : '';

      printDebug('RESPONSE <<<-- | $statusCode | $path | $jsonData');

      return Response(ok: true, data: jsonData);
    } on TimeoutException catch (_) {
      printError('Network --> post($path) | Server connection timed out');
      return Response(ok: false);
    } on SocketException catch (_) {
      printError("Network --> post($path) | You aren't connected to internet");
      return Response(ok: false);
    } catch (e, s) {
      printError("Network --> post($path) | Connection Lost");
      printError(e.toString());
      printError(s.toString());
      return Response(ok: false);
    }
  }

  Future<Response> put(path, {required data, bool showErrorMsg = true}) async {
    try {
      final payload = data;

      printInfo('REQUEST -->>> | POST | $path | $payload');

      int statusCode = 0;
      String reply = '';

      if (Config.MOCK) {
        final mockResp = await MockServer(path).post(payload);
        reply = mockResp.data;
        statusCode = mockResp.statusCode;
      } else {
        final httpClient = HttpClient();
        HttpClientRequest request =
            await httpClient.putUrl(Uri.parse(apiURL + path));
        request.headers.set('content-type', 'application/json');
        request.headers.set('Authorization', 'Bearer ${_authService.token}');
        request.headers.contentLength =
            utf8.encode(json.encode(payload)).length;
        request.add(utf8.encode(json.encode(payload)));
        HttpClientResponse response =
            await request.close().timeout(Duration(milliseconds: timeout));
        reply = await response.transform(utf8.decoder).join();
        statusCode = response.statusCode;
        httpClient.close();
      }

      if (authErrorHandler(statusCode, path)) return Response(ok: false);

      if (serverErrorHandler(reply, statusCode, path, 'post', showErrorMsg)) {
        return Response(ok: false);
      }

      final jsonData = reply != '' ? jsonDecode(reply) : '';

      printDebug('RESPONSE <<<-- | $statusCode | $path | $jsonData');

      return Response(ok: true, data: jsonData);
    } on TimeoutException catch (_) {
      printError('Network --> post($path) | Server connection timed out');
      return Response(ok: false);
    } on SocketException catch (_) {
      printError("Network --> post($path) | You aren't connected to internet");
      return Response(ok: false);
    } catch (e, s) {
      printError("Network --> post($path) | Connection Lost");
      printError(e.toString());
      printError(s.toString());
      return Response(ok: false);
    }
  }

  Future<Response> delete(path,
      {required data, bool showErrorMsg = true}) async {
    try {
      final payload = data;

      printInfo('REQUEST -->>> | POST | $path | $payload');

      int statusCode = 0;
      String reply = '';

      if (Config.MOCK) {
        final mockResp = await MockServer(path).post(payload);
        reply = mockResp.data;
        statusCode = mockResp.statusCode;
      } else {
        final httpClient = HttpClient();
        HttpClientRequest request =
            await httpClient.deleteUrl(Uri.parse(apiURL + path));
        request.headers.set('content-type', 'application/json');
        request.headers.set('Authorization', 'Bearer ${_authService.token}');
        request.headers.contentLength =
            utf8.encode(json.encode(payload)).length;
        request.add(utf8.encode(json.encode(payload)));
        HttpClientResponse response =
            await request.close().timeout(Duration(milliseconds: timeout));
        reply = await response.transform(utf8.decoder).join();
        statusCode = response.statusCode;
        httpClient.close();
      }

      if (authErrorHandler(statusCode, path)) return Response(ok: false);

      if (serverErrorHandler(reply, statusCode, path, 'post', showErrorMsg)) {
        return Response(ok: false);
      }

      final jsonData = reply != '' ? jsonDecode(reply) : '';

      printDebug('RESPONSE <<<-- | $statusCode | $path | $jsonData');

      return Response(ok: true, data: jsonData);
    } on TimeoutException catch (_) {
      printError('Network --> post($path) | Server connection timed out');
      return Response(ok: false);
    } on SocketException catch (_) {
      printError("Network --> post($path) | You aren't connected to internet");
      return Response(ok: false);
    } catch (e, s) {
      printError("Network --> post($path) | Connection Lost");
      printError(e.toString());
      printError(s.toString());
      return Response(ok: false);
    }
  }

  bool authErrorHandler(int statusCode, String path) {
    if (statusCode == 401 || statusCode == 403) {
      if (!path.contains('token')) {
        GetIt.I.get<AuthService>().loginOut();
        // navigatorKey.currentState?.popUntil((route) => route.isFirst);
        // navigatorKey.currentState?.pushReplacementNamed(Routes.LOGIN);
      }

      printError(
          'RESPONSE <<<-- | $statusCode | $path | authErrorHandler | Invalid Token');
      return true;
    }

    return false;
  }

  bool serverErrorHandler(
      dynamic data, int statusCode, String path, String method,
      [bool showErrorMsg = true]) {
    final successStatus = [200, 201];

    if (successStatus.contains(statusCode)) return false;

    final djangoErr = extractErrorFromDjangoHTML(data);
    printError(
        'ERROR <<<-- | $statusCode | $method($path) | ${djangoErr.title} ::: ${djangoErr.message}');
    return true;
  }
}
