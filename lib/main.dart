// ignore_for_file: avoid_print

import 'dart:async';

import 'package:eng_mobile_app/routes/routes.dart';
import 'package:eng_mobile_app/services/auth/auth_service.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:eng_mobile_app/routes/pages.dart';
import 'package:eng_mobile_app/pages/layout/layout.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final navigatorKey = GlobalKey<NavigatorState>();
String startPage = '/home';

void main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      GetIt.I.registerSingleton(AuthService());

      WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      await authenticate();
      FlutterNativeSplash.remove();

      runApp(const ProviderScope(child: MyApp()));
    },
    (Object error, StackTrace stackTrace) async {
      print('Triggers asynchrounous error');
      final String errorAndTrace =
          "${error.toString()} '\n' ${stackTrace.toString()}";
      print(errorAndTrace);
    },
  );

  FlutterError.onError = (FlutterErrorDetails errorDetails) {
    print('This triggers synchronous error');
    print(errorDetails.stack);
  };
}

authenticate() async {
  print('AUTH INIT');
  await sleep(500);
  // bool isAuth = await GetIt.I.get<AuthService>().checkTokenValidity();
  // startPage = isAuth ? Routes.HOME : Routes.LOGIN;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (context, widget) => Layout(widget!),
          title: 'Material App',
          navigatorKey: navigatorKey,
          initialRoute: startPage,
          routes: Pages.routes),
    );
  }
}
