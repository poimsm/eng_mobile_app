// import 'dart:async';
// import 'dart:io';
// import 'dart:convert';
// import 'package:get_it/get_it.dart';
// import 'package:gondola/data/network/mockserver.dart';
// import 'package:gondola/main.dart';
// import 'package:gondola/routes/routes.dart';
// import 'package:gondola/services/auth/auth_service.dart';
// import 'package:gondola/services/logger.dart';
// import 'package:gondola/config.dart';
// import 'package:gondola/utils/custom_exceptions.dart';
// import 'package:gondola/utils/helpers.dart';
// import 'package:gondola/utils/show_alert.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Response {
//   bool ok;
//   dynamic data;

//   Response({required this.ok, this.data});
// }

// class Network {
//   int timeout;
//   String apiURL;
//   final logger = Logger(className: 'Network');
//   final _authService = GetIt.I.get<AuthService>();

//   Network({this.timeout = 60 * 1000, this.apiURL = Config.API_URL});

//   Future<Response> get(String path,
//       {bool showErrorMsg = true, bool internetError = true}) async {
//     try {
//       path = await addGETExecutionNumber(path);
//       logger.info('REQUEST -->>> | GET | $path');

//       int statusCode = 0;
//       String reply = '';

//       if (Config.MOCK) {
//         final mockResp = await MockServer(path).get();
//         reply = mockResp.data;
//         statusCode = mockResp.statusCode;
//       } else {
//         final httpClient = HttpClient();
//         HttpClientRequest request =
//             await httpClient.getUrl(Uri.parse(apiURL + path));
//         request.headers.set('content-type', 'application/json');
//         request.headers.set('Authorization', 'Bearer ${_authService.token}');
//         HttpClientResponse response =
//             await request.close().timeout(Duration(milliseconds: timeout));
//         reply = await response.transform(utf8.decoder).join();
//         statusCode = response.statusCode;
//         httpClient.close();
//       }

//       if (authErrorHandler(statusCode, path)) return Response(ok: false);

//       if (serverErrorHandler(reply, statusCode, path, 'get', showErrorMsg)) {
//         return Response(ok: false);
//       }

//       final data = reply != '' ? jsonDecode(reply) : '';

//       logger.debug('RESPONSE <<<-- | $statusCode | $path | $data');
//       return Response(ok: true, data: data);
//     } on TimeoutException catch (e) {
//       loggerError(
//           errorMsg: 'ERROR de Conexión | Se perdio la conexión con el servidor',
//           stacktrace: e,
//           showAlertBool: showErrorMsg,
//           method: 'Network --> get($path)');

//       return Response(ok: false);
//     } on SocketException catch (e, s) {
//       bool noInternetCode = e.toString().indexOf('errno = 101') > 0;
//       String msg = 'ERROR de Conexión | Se perdio la conexión con el servidor';

//       if (noInternetCode) {
//         msg = 'ERROR de Conexión | No estas conectado a internet';
//       }

//       loggerError(
//           errorMsg: msg,
//           showAlertBool: showErrorMsg,
//           method: 'Network --> get($path)');
//       return Response(ok: false, data: {'no-connection': noInternetCode});
//     } catch (e, s) {
//       loggerError(
//           errorMsg: e,
//           stacktrace: s,
//           method: 'Network --> get($path)',
//           showAlertBool: showErrorMsg);

//       return Response(ok: false);
//     }
//   }

//   Future<Response> post(path, {required data, bool showErrorMsg = true}) async {
//     try {
//       final payload = await addPOSTExecutionNumber(path, data);
//       logger.info('REQUEST -->>> | POST | $path | $payload');

//       int statusCode = 0;
//       String reply = '';

//       if (Config.MOCK) {
//         final mockResp = await MockServer(path).post(payload);
//         reply = mockResp.data;
//         statusCode = mockResp.statusCode;
//       } else {
//         final httpClient = HttpClient();
//         HttpClientRequest request =
//             await httpClient.postUrl(Uri.parse(apiURL + path));
//         request.headers.set('content-type', 'application/json');
//         request.headers.set('Authorization', 'Bearer ${_authService.token}');
//         request.headers.contentLength = utf8.encode(json.encode(payload)).length;
//         request.add(utf8.encode(json.encode(payload)));
//         HttpClientResponse response =
//             await request.close().timeout(Duration(milliseconds: timeout));
//         reply = await response.transform(utf8.decoder).join();
//         statusCode = response.statusCode;
//         httpClient.close();
//       }

//       if (authErrorHandler(statusCode, path)) return Response(ok: false);

//       if (serverErrorHandler(reply, statusCode, path, 'post', showErrorMsg)) {
//         return Response(ok: false);
//       }

//       final jsonData = reply != '' ? jsonDecode(reply) : '';

//       logger.debug('RESPONSE <<<-- | $statusCode | $path | $jsonData');

//       return Response(ok: true, data: jsonData);
//     } on TimeoutException catch (e) {
//       print('🌟🌟🌟🌟 1');
//       loggerError(
//           errorMsg: 'ERROR de Conexión | Se perdio la conexión con el servidor',
//           stacktrace: e,
//           showAlertBool: showErrorMsg,
//           method: 'Network --> post($path)');
//       return Response(ok: false);
//     } on SocketException catch (e) {
//       print('🌟🌟🌟🌟 2');
//       bool noInternetCode = e.toString().indexOf('errno = 101') > 0;
//       String msg = 'ERROR de Conexión | Se perdio la conexión con el servidor';

//       if (noInternetCode) {
//         msg = 'ERROR de Conexión | No estas conectado a internet';
//       }

//       loggerError(
//           showAlertBool: showErrorMsg,
//           errorMsg: msg,
//           method: 'Network --> post($path)');

//       return Response(ok: false);
//     } catch (e, s) {
//       print('🌟🌟🌟🌟 3');
//       loggerError(
//         errorMsg: e,
//         stacktrace: s,
//         method: 'Network --> post($path)',
//         showAlertBool: showErrorMsg,
//       );

//       return Response(ok: false);
//     }
//   }

//   Future<String> addGETExecutionNumber(String path) async {
//     final prefs = await SharedPreferences.getInstance();
//     final executionNumber = prefs.getInt('execution_number');
//     bool isExcludedPath = path.contains('gondolas') ||
//         path.contains('stores') ||
//         path.contains('execution-number') ||
//         (path.contains('user') && !path.contains('user/last-result')) ||
//         path.contains('token') ||
//         path.contains('audite/number');

//     if (executionNumber != null && !isExcludedPath) {
//       if (path.contains('?')) {
//         path = path + '&execution_number=${executionNumber}';
//       } else {
//         path = path + '?execution_number=${executionNumber}';
//       }
//     }
//     return path;
//   }

//   Future addPOSTExecutionNumber(String path, data) async {
//     final prefs = await SharedPreferences.getInstance();
//     final executionNumber = prefs.getInt('execution_number');
//     bool isExcludedPath = path.contains('execution-number') ||
//         path.contains('audite/number') ||
//         path.contains('user') ||
//         path.contains('token');

//     if (executionNumber != null && !isExcludedPath) {
//       data['execution_number'] = executionNumber.toString();
//     }

//     return data;
//   }

//   bool authErrorHandler(int statusCode, String path) {
//     if (statusCode == 401 || statusCode == 403) {
//       if (!path.contains('token')) {
//         GetIt.I.get<AuthService>().loginOut();
//         navigatorKey.currentState?.popUntil((route) => route.isFirst);
//         navigatorKey.currentState?.pushReplacementNamed(Routes.LOGIN);
//       }
//       logger.error('RESPONSE <<<-- | $statusCode | Invalid Token',
//           method: 'authErrorHandler()');
//       return true;
//     }

//     return false;
//   }

//   bool serverErrorHandler(
//       dynamic data, int statusCode, String path, String method,
//       [bool showErrorMsg = true]) {
//     final successStatus = [200, 201];

//     if (successStatus.contains(statusCode)) return false;

//     final djangoErr = extractErrorFromDjangoHTML(data);
//     loggerError(
//         showAlertBool: showErrorMsg,
//         alertMsg: 'ERROR: ${djangoErr.title} | ${djangoErr.message}',
//         errorMsg:
//             'ERROR <<<-- | $statusCode | $path | ${djangoErr.title} ::: ${djangoErr.message}',
//         method: 'Network --> $method($path)');
//     return true;
//   }

//   loggerError(
//       {required errorMsg,
//       required method,
//       stacktrace,
//       alertMsg,
//       bool showAlertBool = true}) {
//     dynamic alertMessage;

//     if (alertMsg != null) {
//       alertMessage = alertMsg;
//     } else {
//       alertMessage = errorMsg;
//     }

//     if (showAlertBool) {
//       if (stacktrace != null) {
//         ShowAlert(alertMessage, stacktrace: stacktrace, method: method);
//       } else {
//         ShowAlert(alertMessage, method: method);
//       }
//     }

//     logger.error(errorMsg, stacktrace: stacktrace, method: method);
//   }
// }
